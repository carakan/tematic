<?php
// Chat script by WebTemp.org

// Start a session and get/generate a random user_id
// We'll use this user_id to create pseudo-uniquely colored chat lines later
// Close the session (a session can only be accessed by one process at a time)
error_reporting(0);
session_start();
header('Cache-control: private'); // IE6 fix
header("Content-Type: text/html; charset=utf-8");
if (!isset($_SESSION['USER_ID'])) $_SESSION['USER_ID'] = rand(1, 24);
$USER_ID = $_SESSION['USER_ID'];
session_write_close();
ob_flush();
flush();

// Path to the text files holding the chat window content
$fn = 'chat.txt';

// Did the browser request the chat content?
// If so, it provided this script with its last known line number
$read = &$_GET['r'];
if (isset($read)) {
  // Create the chat file if neccessary
  if (!file_exists($fn)) {
    touch($fn);
    chmod($fn, 0644);
  }
  if ($read == 0) chat_write('<E>');
  // The script will not exit on its own on user disconnect
  // this way we can later add a "user left chat" message
  ignore_user_abort(true);
  $i = 0;
  while (true) {
    // Open the chat file and get the current line number
    $f = fopen($fn, 'r');
    flock($f, 2);
    $offset = 0;
    $offset = trim(fgets($f));
    // Break the loop if the browser is not up to date
    if ($offset > $read) break;
    // If the browser is up to date, wait
    flock($f, 3);
    fclose($f);
    @set_time_limit(0);
    // By default we wait 3 seconds between each check
    // However, after one minute of complete silence in the chat we step
    // back to 10 second periods to save server resources
    if ($i > 20) sleep(10);
    else sleep(3);
    // To check for user disconnection we have to output at least one byte
    // We'll echo a line break since this does no harm to our JavaScript
    echo "\n";
    ob_flush();
    flush();
    if (connection_status() != 0) {
      // This is where a user disconnection is detected
      // You could add stuff to display "user left chat" messages here
      chat_write('<L>');
      exit();
    }
    $i++;
  }
  // If the loop was exited, we end up here
  // Now, echo all missing lines
  while ($s = fgets($f)) {
    echo utf8_encode($s);
    if ($offset <= ++$read) break;
  }
  // Close the file, exit
  flock($f, 3);
  fclose($f);
  exit();
}

// This function writes one line into the chat file
// For easiest accessibility newer lines are on top!
function chat_write($write) {
  global $USER_ID, $fn;
  // Maximum line count
  $maxlines = 35;
  if (trim($write) == '') return;
  // Create the chat file if neccessary
  if (!file_exists($fn)) {
    touch($fn);
    chmod($fn, 0644);
  }
  // Open the chat file and get the current line number
  $f = fopen($fn, 'r+');
  flock($f, 2);
  $offset = 0;
  fscanf($f, "%s\n", $offset);
  // Increase by one as we're adding a new line now
  $offset++;
  $i = 0;
  $chat = '';
  // First we have to read the whole file
  // Lines are being read one by one until we're at the end or until we reach $maxlines
  while (($i < $maxlines) && ($s = fgets($f))) {
    $chat .= $s;
    $i++;
  }
  // This is the actual line we're adding
  // You see: The chat file contains JavaScript calls
  // This way no parsing of the lines is neccessary
  // We'll just need to eval() them in our JavaScript
  $time = date('H:i:s');
  $js = "cs($offset,$USER_ID,'$time','User','$write','');\n";
  // Go to the top
  fseek($f, 0);
  // Empty the file
  ftruncate($f, 0);
  // Write the new offset
  fwrite($f, "$offset\n");
  // Write the new line
  fwrite($f, $js);
  // And then the rest
  fwrite($f, $chat);
  // Close the file
  flock($f, 3);
  fclose($f);
  // We'll return the last added line to the calling
  return $js;
}

function chat_delete($delete) {
  global $fn;
  if ($delete == '') exit();
  if (!file_exists($fn)) {
    touch($fn);
    chmod($fn, 0644);
  }
  $f = fopen($fn, 'r+');
  flock($f, 2);
  $offset = 0;
  fscanf($f, "%s\n", $offset);
  $chat = '';
  $i = 0;
  while ($s = fgets($f)) {
    $s = str_replace("'$delete'", "''", $s);
    $chat .= $s;
    $i++;
  }
  fseek($f, 0);
  ftruncate($f, 0);
  fwrite($f, "$offset\n");
  fwrite($f, $chat);
  flock($f, 3);
  fclose($f);
}

// Did the browser send a new chat line?
$write = &$_POST['w'];
if (isset($write)) {
  if ($write == '') exit();
  // Remove the slashes that were added to the form contents by PHP automatically
  $write = stripslashes($write);
  // 150 bytes ought to be enough for anyone
  if (strlen($write) > 150) exit();
//  if (strlen($write) > 15) if (substr_count($write, substr($write, 6, 8)) > 1) exit();
  // Transform characters like < and > into their HTML representations
  $write = htmlspecialchars($write, ENT_QUOTES);
  $write = addslashes($write);
  if (strpos($write, '/del ') === 0) {
    $delete = str_replace('/del ', '', $write);
    chat_delete($delete);
    exit();
  }
  // Add the new line to the chat file
  $js = chat_write($write);
  // The function returns the last added JavaScript line
  // We'll output this so the users can read their own text without delay right after sending
  echo utf8_encode($js);
  exit();
}
?>
var lines    = 35;
var title    = '';
var offset   = 0;
var messages = new Array();
var message  = document.getElementById('message');
var chat     = document.getElementById('chat');
var tmrRead = setTimeout('chat_read();', 300);

function request_write(url, post) {
  r = false;
  if (window.XMLHttpRequest) {
    r = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    try {
      r = new ActiveXObject("Msxml2.XMLHTTP");
    } catch(e) {
      try {
        r = new ActiveXObject("Microsoft.XMLHTTP");
      } catch(e) {
      }
    }
  }
  if (!r) return false;
  r.onreadystatechange = alert_write;
  if (post == null) {
    r.open('GET', url, true);
    r.send(null);
  } else {
    r.open('POST', url, true);
    r.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    r.send(post);
  }
}

function alert_write() {
  try {
    if ((r.readyState == 4) && (r.status == 200)) parse(r.responseText);
  } catch(e) {
  }
}

function request_read(url, post) {
  r2 = false;
  if (window.XMLHttpRequest) {
    r2 = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    try {
      r2 = new ActiveXObject("Msxml2.XMLHTTP");
    } catch(e) {
      try {
        r2 = new ActiveXObject("Microsoft.XMLHTTP");
      } catch(e) {
      }
    }
  }
  if (!r2) return false;
  r2.abort();
  r2.onreadystatechange = alert_read;
  if (post == null) {
    r2.open('GET', url, true);
    r2.send(null);
  } else {
    r2.open('POST', url, true);
    r2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    r2.send(post);
  }
}

function alert_read() {
  clearTimeout(tmrRead);
  try {
    if ((r2.readyState == 4) && (r2.status == 200)) {
      parse(r2.responseText);
      tmrRead = setTimeout('chat_read();', 30);
    }
  } catch(e) {
    tmrRead = setTimeout('chat_read();', 3000);
  }
}

function chat_read() {
  clearTimeout(tmrRead);
  request_read('chat.php?r='+offset, null);
}

function keyup(e) {
  if (window.event) k = window.event.keyCode;
  else if (e) k = e.which;
  else return true;
  if (k == 13) chat_write();
}

function chat_display() {
  html = '';
  i = 0;
  while ((i < lines) && (i < offset)) {
    h = offset-i;
    if (messages[h]) html = messages[h] + html;
    i++;
  }
  chat.innerHTML = html;
  if (title != '') {
    title = title.replace(/&amp;/g, '&');
    title = title.replace(/&quot;/g, '"');
    title = title.replace(/&#039;/g, '\'');
    title = title.replace(/&lt;/g, '<');
    title = title.replace(/&gt;/g, '>');
    document.title = title + ' - Chat by WebTemp.org';
  }
}

function chat_write() {
  request_write('chat.php', 'w='+escape(message.value));
  message.value = '';
}

function cs(o, i, t, u, m, c) {
  if (m == '<E>') {
    if (u != '') messages[o] = '<span id="C'+i+'">['+t+'] * '+u+' has entered the chat *</span><br />';
  } else if (m == '<L>') {
    if (u != '') messages[o] = '<span id="C'+i+'">['+t+'] * '+u+' has left the chat *</span><br />';
  } else {
    if (u != '') {
      u += ':';
      spaces = 5 - u.length;
      for (j = 0; j < spaces; j++) u += "&nbsp;";
      u += ' ';
    }
    if (title == '') title = m;
    m = m.replace(/ /g, '&nbsp;');
    messages[o] = '<span id="C'+i+'">['+t+'] '+u+'<b>'+m+'</b></span><br />';
  }
  if (o > offset) {
    offset = o;
    window.focus();
    message.focus();
  }
}

function parse(s) {
  if (s != '') {
    s = unescape(s);
    eval(s);
    chat_display();
  }
}

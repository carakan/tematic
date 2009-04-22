<?php 
if $_GET["pc"] == "biblioteca" && $_GET["tB"] == "glosario" {
    header("location: http://www.bancotematico.org/biblioteca/glosario/");
}
else{
    if $_GET["pc"] == "biblioteca" && $_GET["tB"] == "fichas" {
    header("location: http://www.bancotematico.org/biblioteca/fichas_tematicas/");
    }
    else{
        if $_GET["pc"] == "biblioteca" && $_GET["tB"] == "documentos" {
            header("location: http://www.bancotematico.org/biblioteca/documentos/");
        }
        else{
            header("location: http://www.bancotematico.org/");
        }
    }
}
?>


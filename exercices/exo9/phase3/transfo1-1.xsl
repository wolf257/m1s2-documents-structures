<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <link href='../../../css/style.css' rel='stylesheet' type='text/css' />
                <title>E9 - Q3-1 : mise en page simple </title>
            </head>
            
            <body>
                <h1>E9 - Q3-1 : Air France - Feuille de style 'minimale' </h1>
                
                <xsl:apply-templates/>
                
            </body>
        </html>
    </xsl:template>
    
    <!-- ================= -->
    <xsl:template match="ref_persos">
        <h3> Travail réalisé par : </h3>
        <ul>
        <xsl:for-each select="./*">
            <li> <b> <xsl:value-of select ="name(.)"/> </b> : <xsl:value-of select="."/> </li>
        </xsl:for-each>
        </ul>
    </xsl:template>

    <!-- ================= -->
    <xsl:template match="teiCorpus.2/teiHeader">
        <h3> Informations techniques sur le fichier : </h3>
        
        <xsl:for-each select="*/*">         
            <p> - <b> <xsl:value-of select ="name(.)"/> </b> : <xsl:value-of select="."/> </p>
        </xsl:for-each>
        
    </xsl:template>

    <!-- ================= -->
    <xsl:template match="head">
        
        <!-- RETOUR VERS EXO -->
        <div class="linkup"> <a href="../../exo9.xml"> Retour à la page de l'exercice </a> </div>
        
        <h2> <xsl:value-of select="."/> </h2>
        
    </xsl:template>
    
    <!-- ================= -->
    <xsl:template match="u">
        <p> - <xsl:value-of select="./@who"/> : <xsl:value-of select="."/> </p>
    </xsl:template>
    
</xsl:stylesheet>
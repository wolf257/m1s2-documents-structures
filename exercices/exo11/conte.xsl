<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <link href='../../css/style.css' rel='stylesheet' type='text/css' />
                <title>E11 : Un conte à votre façon</title>
            </head>
            
            <body>
                
                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../exo11.xml"> Retour à la page de l'exercice </a> </div>
                
                <h1> Un conte à votre façon ... </h1>
                
                <h3> Notice </h3>
                <p> <xsl:value-of select="//notice"/> </p>
                
                <h3> Introduction </h3>
                <p> <xsl:value-of select="//intro"/> </p>
                
                <h3> À vous </h3>
                <xsl:apply-templates select="//pageConte"/>

                <h3> Informations complémentaires </h3>
                <p> Auteur : <xsl:value-of select="//auteur"/> </p>

                <p> Source : <xsl:value-of select="//source"/> </p>
                
                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../exo11.xml"> Retour à la page de l'exercice </a> </div>
                
                <!-- RETOUR VERS ACCUEIL -->
                <div class="linkup"> <a href="../../index.xml"> Retour à la page d'accueil </a> </div>
                
                <br/><br/><br/><br/><br/><br/><br/> 
                <br/><br/><br/><br/><br/><br/><br/> 
                <br/><br/><br/><br/><br/><br/><br/> 
                <br/><br/><br/><br/><br/><br/><br/> 
                
                
            </body>
        </html>
    </xsl:template>
    
    <!-- =============================================================================== -->
    <xsl:template match="//pageConte">
        
        <xsl:for-each select="lieu">
            <!-- ref du lieu -->
            <xsl:variable name="nb" select="./@num"></xsl:variable>
            
            <!-- Le lieu / histoire / question -->
            <p id="{$nb}" style="text-align:justify; font-size:31px;"> <xsl:value-of select="$nb"/> - <xsl:value-of select="./question"/> </p>
            
            <!-- Les choix -->
            <ul>
                
                <xsl:for-each select="./choix">
                    
                    <li>
                    <!-- ref de la cible à toucher si clic -->
                    <xsl:variable name="cible">
                        <xsl:value-of select="@cible"/>
                    </xsl:variable>
                    
                        <a href="#{$cible}"> <xsl:value-of select="."/> </a>
                    </li>
                    
                </xsl:for-each> <!-- /choix -->
                
            </ul>
            <p style="text-align:center;"> --------------- --------------- --------------- --------------- --------------- --------------- --------------- </p>
            
        </xsl:for-each> <!-- /lieu -->
        
    </xsl:template>
    
</xsl:stylesheet>
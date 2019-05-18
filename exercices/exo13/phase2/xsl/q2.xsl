<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <link href='../../../../css/style.css' rel='stylesheet' type='text/css' />
                <title>E13 - Q2 : xsl - 2</title>
            </head>
            
            <body>

                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../../../exo13o.xml"> Retour à la page de l'exercice </a> </div>
                
                <h1> Alignement titre + descrption </h1>
                
                
                <xsl:for-each select="//file">
                    <xsl:if test="./@type='titre'">
                        <xsl:variable name="positionBlocTitres" select="position()"/>
                        <xsl:variable name="positionBlocDesc" select="$positionBlocTitres+1"/>
                        
                        <h3> Bloc <xsl:value-of select="$positionBlocTitres"/> </h3>

                        
                        <!-- PARTIE TITRE -->
                        <xsl:for-each select="./titre">
                            <xsl:variable name="positionTitre" select="position()"/>
                            <xsl:variable name="positionDesc" select="$positionTitre"/>
                            
                            <p> <em> Titre <xsl:value-of select="$positionTitre"/> </em> : 
                            <xsl:for-each select="./p/item">
                                <xsl:value-of select="./a[2]"/> <xsl:text> </xsl:text>
                            </xsl:for-each>
                            </p>
                            
                            <!-- PARTIE DESC -->
                            <xsl:for-each select="//file[position() = $positionBlocDesc]/description">
                                <xsl:if test="position() = $positionTitre">
                                    <p> <em> Description <xsl:value-of select="position()"/> </em> :
                                        <xsl:for-each select="./p/item">
                                            <xsl:value-of select="./a[2]"/> <xsl:text> </xsl:text>                                
                                        </xsl:for-each>
                                    </p>
                                </xsl:if>
                            </xsl:for-each>
                            
                        </xsl:for-each>

                        
                    </xsl:if>
                </xsl:for-each>                                        
                   
                
            </body>
        </html>
    </xsl:template>


    
    <!--<xsl:for-each select="//file[position() = $positionBlocDesc]/description">
        <p> Description <xsl:value-of select="position()"/> :
            <xsl:for-each select="./p/item">
                <xsl:value-of select="./a[2]"/> <xsl:text> </xsl:text>                                
            </xsl:for-each>
        </p>
    </xsl:for-each>
    -->
    
</xsl:stylesheet>
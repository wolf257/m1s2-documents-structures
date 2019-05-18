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
                <title>E13 - Q2 : xsl - 1</title>
            </head>
            
            <body>

                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../../../exo13o.xml"> Retour à la page de l'exercice </a> </div>
                
                <h1> Affichage des «titres» uniquement </h1>
                                   
                <xsl:for-each select="//file">
                    <xsl:if test="./@type='titre'">
<!--                        <p> File de type titre </p>-->
                        
                        <xsl:for-each select="./titre">
                            <p> 
                            <xsl:for-each select="./p/item">
                                <xsl:value-of select="./a[2]"/> <xsl:text> </xsl:text>
                            </xsl:for-each>
                            </p>
                        </xsl:for-each>
                        
                    </xsl:if>
                </xsl:for-each>                                        
<!--                       <xsl:apply-templates select=".//file"/>-->
                   
                
            </body>
        </html>
    </xsl:template>
    

    
</xsl:stylesheet>
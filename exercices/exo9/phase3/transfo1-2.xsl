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
                <title>E9 - Q3-2 : contexte</title>
            </head>
            
            <body>
                <h1>E9 - Q3-2 : Air France - Contextualisation </h1>
                
                <xsl:for-each select="//text/group/text/body/div/u">
                    <xsl:if test="self::u[contains(text(), 'quand')]">
                        
                        <!-- Référence de la communication -->
                        <h3> <xsl:value-of select="../head"/>, n = <xsl:value-of select="@n"/>, locuteur = <xsl:value-of select="@who"/> </h3>
                        
                        <!-- Contexte précédent -->
                        <p> <em> Précédent: <xsl:value-of select="preceding-sibling::u[1]"/> </em> </p>
                        
                        <!-- Le pivot -->
                        <center> <p> <strong>
                                <xsl:value-of select="substring-before(string(.),'quand')"/>
                                <font color="green" size="+3"> <xsl:text>quand</xsl:text> </font>
                                <xsl:value-of select="substring-after(string(.),'quand')"/>
                        </strong> </p> </center>
                        
                        <!-- Contexte droite -->
                        <p> <em> Suivant:  <xsl:value-of select="following-sibling::u[1]"/> </em> </p>
                    
                    </xsl:if>
                    
                </xsl:for-each>
                
                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../../exo9.xml"> Retour à la page de l'exercice </a> </div>
                     
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
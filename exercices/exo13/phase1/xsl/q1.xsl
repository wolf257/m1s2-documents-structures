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
                <title>E13 - Q1 : xsl</title>
            </head>
            
            <body>

                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../../exo13o.xml"> Retour à la page de l'exercice </a> </div>
                
                <h1> Simple affichage du contenu TreeTagger </h1>
                                   
                   <table>
                       <tr>
                           <th> type </th> <th> lemma </th> <th> string </th>
                       </tr>
                       
                        <xsl:apply-templates select="//element"/>
                       
                   </table>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="element">
        
        <tr>
            <!-- type -->
            <td> <xsl:value-of select="./data[1]"/> </td>
            <!-- lemma -->
            <td><xsl:value-of select="./data[2]"/></td>
            <!-- string -->
            <td><xsl:value-of select="./data[3]"/></td>
        </tr>
        
    </xsl:template>

    
</xsl:stylesheet>
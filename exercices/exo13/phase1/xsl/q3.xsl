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
                <title>E13 - Q1 : xsl - Q3 </title>
            </head>
            
            <body>
                
                
                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../../exo13o.xml"> Retour à la page de l'exercice </a> </div>
                
                <h2> Affichage contenu TreeTagger avec mise en évidence patrons </h2>
                <h2> Patron : Nom - Adj </h2>
                <xsl:for-each select="//item">
                    <h4> Item : <xsl:value-of select="./@number"/> </h4>
                    
                    <xsl:for-each select=".//titre|.//description">
                        <p> <xsl:apply-templates select=".//element"/> </p>
                    </xsl:for-each>
                </xsl:for-each>
<!--                <table>
                    <tr>
                        <th> type </th> <th> lemma </th> <th> string </th>
                    </tr>
                    
                    
                    
                </table>-->
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="element">
        
        
        <!-- Var Globale -->
        <!-- 1 --> <xsl:variable name="var1" select="'NOM'"/> <!-- 2 --> <xsl:variable name="var2" select="'ADJ'"/>
        <!-- 3 --> <xsl:variable name="var3" select="'VER'"/> <!-- 4 --> <xsl:variable name="var4" select="'PRP'"/>
        <!-- 5  --> <xsl:variable name="var5" select="'ADV'"/>
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./data[1]"/>
        <xsl:variable name="lemmaHere" select="./data[2]"/>
        <xsl:variable name="stringHere" select="./data[3]"/>
        
        <!-- Niveau 2 -->
        <xsl:variable name="tagNext" select="following-sibling::element[1]/data[1]"/>
        <xsl:variable name="lemmaNext" select="following-sibling::element[1]/data[2]"/>
        <xsl:variable name="stringNext" select="following-sibling::element[1]/data[3]"/>
        
        
        <!-- NOM - ADJ -->
        <xsl:if test="($tagHere[contains(text(),$var1)]) and ($tagNext[contains(text(), $var2)])">
            <mark> <span style="color:red"> <xsl:value-of select="$stringHere"/> </span> </mark> 
                [<span style="color:blue"> <xsl:value-of select="$tagHere"/> </span> | 
                 <span style="color:green"> <xsl:value-of select="$lemmaHere"/> </span> ]
            <mark> <span style="color:red"> <xsl:value-of select="$stringNext"/> </span> </mark> 
            [ <span style="color:blue"> <xsl:value-of select="$tagNext"/> </span> | 
                <span style="color:green"> <xsl:value-of select="$lemmaNext"/> </span> ]
            
        </xsl:if>
        
        <!-- string -->
        <span style="color:red"> <xsl:value-of select="./data[3]"/> </span> <xsl:text>  </xsl:text>
            <!-- type -->
        [ <span style="color:blue"> <xsl:value-of select="./data[1]"/> </span> <xsl:text> | </xsl:text>
            <!-- lemma -->
        <span style="color:green"> <xsl:value-of select="./data[2]"/> </span> ] <xsl:text>  </xsl:text>
            
        
        
    </xsl:template>
    
    
</xsl:stylesheet>
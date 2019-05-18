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
                <title>E13 - Q2 : xsl - 4</title>
            </head>
            
            <body>
                
                
                <!-- RETOUR VERS EXO -->
                <div class="linkup"> <a href="../../../exo13o.xml"> Retour à la page de l'exercice </a> </div>
                
                <h2> Affichage contenu Talismane avec mise en évidence patrons </h2>
                <h2> Patron : Nom - verbe </h2>
                
<!--                <xsl:apply-templates select="//file[starts-with(@type, 'titre')]" mode="oneVar"/>-->
                
                <h3> Traitement des titres (voir 'traitement des descriptions' plus bas) </h3>
                
                <xsl:for-each select="//file[starts-with(@type, 'titre')]">
                    <h4> Bloc <xsl:value-of select="position()"/> </h4>
                    
                    <xsl:for-each select=".//titre">
                        <p> <xsl:apply-templates select=".//item"/> </p>
                    </xsl:for-each>
                </xsl:for-each>

                <h3> Traitement des descriptions </h3>
                
                <xsl:for-each select="//file[starts-with(@type, 'description')]">
                    <h4> Bloc <xsl:value-of select="position()"/> </h4>
                    
                    <xsl:for-each select=".//description">
                        <p> <xsl:apply-templates select=".//item"/> </p>
                    </xsl:for-each>
                </xsl:for-each>
                
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="item">
        
        
        <!-- Var Globale -->
        <!-- 1 --> <xsl:variable name="var1" select="'N'"/> <!-- 2 --> <xsl:variable name="var2" select="'ADJ'"/>
        <!-- 3 --> <xsl:variable name="var3" select="'V'"/> <!-- 4 --> <xsl:variable name="var4" select="'PRP'"/>
        <!-- 5  --> <xsl:variable name="var5" select="'ADV'"/>
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./a[4]"/>
        <xsl:variable name="lemmaHere" select="./a[3]"/>
        <xsl:variable name="stringHere" select="./a[2]"/>
        
        <!-- Niveau 2 -->
        <xsl:variable name="tagNext" select="following-sibling::item[1]/a[4]"/>
        <xsl:variable name="lemmaNext" select="following-sibling::item[1]/a[3]"/>
        <xsl:variable name="stringNext" select="following-sibling::item[1]/a[2]"/>
        
        
        <!-- NOM - ADJ -->
        <xsl:if test="($tagHere[starts-with(text(),$var1)]) and ($tagNext[starts-with(text(), $var3)])">
            <mark> <span style="color:red"> <xsl:value-of select="$stringHere"/> </span> </mark> 
            [<span style="color:blue"> <xsl:value-of select="$tagHere"/> </span> | 
            <span style="color:green"> <xsl:value-of select="$lemmaHere"/> </span> ]
            <mark> <span style="color:red"> <xsl:value-of select="$stringNext"/> </span> </mark> 
            [ <span style="color:blue"> <xsl:value-of select="$tagNext"/> </span> | 
            <span style="color:green"> <xsl:value-of select="$lemmaNext"/> </span> ]
            
        </xsl:if>
        
        <!-- string -->
        <span style="color:red"> <xsl:value-of select="./a[2]"/> </span> <xsl:text>  </xsl:text>
        <!-- type -->
        [ <span style="color:blue"> <xsl:value-of select="./a[4]"/> </span> <xsl:text> | </xsl:text>
        <!-- lemma -->
        <span style="color:green"> <xsl:value-of select="./a[3]"/> </span> ] <xsl:text>  </xsl:text>
        
        
        
    </xsl:template>
    
    
</xsl:stylesheet>
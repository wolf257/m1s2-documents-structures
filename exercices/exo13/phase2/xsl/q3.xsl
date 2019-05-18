<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Var Globale -->
    <!-- 1 --> <xsl:variable name="var1" select="'NC'"/> <!-- 2 --> <xsl:variable name="var2" select="'ADJ'"/>
    <!-- 3 --> <xsl:variable name="var3" select="'V'"/> <!-- 4 --> <xsl:variable name="var4" select="'P'"/>
    <!-- 5  --> <xsl:variable name="var5" select="'ADV'"/> <!-- 6 --> <xsl:variable name="var6" select="'DET'"/>
    
    <!--
        SCHÉMA GLOBAL
    -->
    
    <xsl:template match="/">
        
        <!-- Transfo1 : NOM -->
        <xsl:result-document  method="text" href="./extraction-q3/titres_1var_{$var1}.txt">
            ------- <xsl:value-of select="$var1"/> ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'titre')]" mode="oneVar"/>
        </xsl:result-document>

        <xsl:result-document  method="text" href="./extraction-q3/descriptions_1var_{$var1}.txt">
            ------- <xsl:value-of select="$var1"/> ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'description')]" mode="oneVar"/>
        </xsl:result-document>
        
        
        <!-- Transfo2 : NOM - ADJ -->    
        <xsl:result-document  method="text" href="./extraction-q3/titres_2var_{$var1}_{$var2}.txt">
            ------- <xsl:value-of select="$var1"/> - <xsl:value-of select="$var2"/> ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'titre')]" mode="twoVar"/>
        </xsl:result-document>  

        <xsl:result-document  method="text" href="./extraction-q3/descriptions_2var_{$var1}_{$var2}.txt">
            ------- <xsl:value-of select="$var1"/> - <xsl:value-of select="$var2"/> ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'description')]" mode="twoVar"/>
        </xsl:result-document>  
        
        <!-- Transfo3 : DET - NOM - ADJ -->
        <xsl:result-document  method="text" href="./extraction-q3/titres_3var_{$var6}_{$var1}_{$var2}.txt">
            ------- <xsl:value-of select="$var6"/> - <xsl:value-of select="$var1"/> - <xsl:value-of select="$var2"/>  ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'titre')]" mode="threeVar"/>
        </xsl:result-document>

        <xsl:result-document  method="text" href="./extraction-q3/descriptions_3var_{$var6}_{$var1}_{$var2}.txt">
            ------- <xsl:value-of select="$var6"/> - <xsl:value-of select="$var1"/> - <xsl:value-of select="$var2"/>  ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'description')]" mode="threeVar"/>
        </xsl:result-document>
        
        <!-- Transfo4 : NOM - PRP - NOM - ADJ -->
        <xsl:result-document  method="text" href="./extraction-q3/titres_4var_{$var2}_{$var1}_{$var4}_{$var1}.txt">
            ------- <xsl:value-of select="$var2"/> - <xsl:value-of select="$var1"/> - <xsl:value-of select="$var4"/> - <xsl:value-of select="$var1"/>  ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'titre')]" mode="fourVar"/>
        </xsl:result-document>

        <xsl:result-document  method="text" href="./extraction-q3/descriptions_4var_{$var2}_{$var1}_{$var4}_{$var1}.txt">
            ------- <xsl:value-of select="$var2"/> - <xsl:value-of select="$var1"/> - <xsl:value-of select="$var4"/> - <xsl:value-of select="$var1"/>  ------- 
            <xsl:apply-templates select="//file[starts-with(@type, 'description')]" mode="fourVar"/>
        </xsl:result-document>
        
    </xsl:template>
    
    <!--
        LES EXTRACTIONS
    -->
    
    <!-- One var -->
    <xsl:template match="item" mode="oneVar">
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./a[4]"/>
        <xsl:variable name="lemmaHere" select="./a[3]"/>
        <xsl:variable name="stringHere" select="./a[2]"/>

        <!-- NOM -->
        
        <xsl:if test="($tagHere[starts-with(text(),$var1)])">
           - <xsl:value-of select="$tagHere"/> : <xsl:value-of select="$stringHere"/>
        </xsl:if>
        
    </xsl:template>
    
    <!-- Two var -->
    <xsl:template match="item" mode="twoVar">
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./a[4]"/>
        <xsl:variable name="lemmaHere" select="./a[3]"/>
        <xsl:variable name="stringHere" select="./a[2]"/>
        
        <!-- Niveau 2 -->
        <xsl:variable name="tagNext" select="following-sibling::item[1]/a[4]"/>
        <xsl:variable name="lemmaNext" select="following-sibling::item[1]/a[3]"/>
        <xsl:variable name="stringNext" select="following-sibling::item[1]/a[2]"/>
        
        <!-- 
        Rappel :
            var1 = NOM, var2 = ADJ , var3 = VERB, var4 = PRP , var5 = ADV,
    -->
        
        <!-- NOM - ADJ -->
        <xsl:if test="($tagHere[starts-with(text(),$var1)]) and ($tagNext[starts-with(text(), $var2)])">
            - <xsl:value-of select="$tagHere"/> - <xsl:value-of select="$tagNext"/> : <xsl:value-of select="$stringHere"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringNext"/> 
        </xsl:if>
        
    </xsl:template>
    
    <!-- Three var -->
    <xsl:template match="item" mode="threeVar">
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./a[4]"/>
        <xsl:variable name="lemmaHere" select="./a[3]"/>
        <xsl:variable name="stringHere" select="./a[2]"/>
        
        <!-- Niveau 2 -->
        <xsl:variable name="tagNext" select="following-sibling::item[1]/a[4]"/>
        <xsl:variable name="lemmaNext" select="following-sibling::item[1]/a[3]"/>
        <xsl:variable name="stringNext" select="following-sibling::item[1]/a[2]"/>
        
        <!-- Niveau 3 -->
        <xsl:variable name="tagThird" select="following-sibling::item[2]/a[4]"/>
        <xsl:variable name="lemmaThird" select="following-sibling::item[2]/a[3]"/>
        <xsl:variable name="stringThird" select="following-sibling::item[2]/a[2]"/>
        
        <!-- 
Rappel :
    var1 = NOM, var2 = ADJ , var3 = VERB, var4 = PRP , var5 = ADV,
-->
        
        <!-- NOM - PRP - NOM -->
        <xsl:if test="($tagHere[starts-with(text(),$var6)]) and ($tagNext[starts-with(text(), $var1)]) and ($tagThird[starts-with(text(), $var2)])">
            - <xsl:value-of select="$tagHere"/> - <xsl:value-of select="$tagNext"/> - <xsl:value-of select="$tagThird"/> :  <xsl:value-of select="$stringHere"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringNext"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringThird"/> 
        </xsl:if>
        
    </xsl:template>
    
    <!-- Four var -->
    <xsl:template match="item" mode="fourVar">
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./a[4]"/>
        <xsl:variable name="lemmaHere" select="./a[3]"/>
        <xsl:variable name="stringHere" select="./a[2]"/>
        
        <!-- Niveau 2 -->
        <xsl:variable name="tagNext" select="following-sibling::item[1]/a[4]"/>
        <xsl:variable name="lemmaNext" select="following-sibling::item[1]/a[3]"/>
        <xsl:variable name="stringNext" select="following-sibling::item[1]/a[2]"/>
        
        <!-- Niveau 3 -->
        <xsl:variable name="tagThird" select="following-sibling::item[2]/a[4]"/>
        <xsl:variable name="lemmaThird" select="following-sibling::item[2]/a[3]"/>
        <xsl:variable name="stringThird" select="following-sibling::item[2]/a[2]"/>
        
        <!-- Niveau 4 -->
        <xsl:variable name="tagFourth" select="following-sibling::item[3]/a[4]"/>
        <xsl:variable name="lemmaFourth" select="following-sibling::item[3]/a[3]"/>
        <xsl:variable name="stringFourth" select="following-sibling::item[3]/a[2]"/>
        
        <!-- 
Rappel :
    var1 = NOM, var2 = ADJ , var3 = VERB, var4 = PRP , var5 = ADV,
-->
        
        <!-- NOM - PRP - NOM - ADJ -->
        <xsl:if test="($tagHere[starts-with(text(),$var2)]) and ($tagNext[starts-with(text(), $var1)]) and ($tagThird[starts-with(text(), $var4)]) and ($tagFourth[starts-with(text(), $var1)])">
            - <xsl:value-of select="$tagHere"/> - <xsl:value-of select="$tagNext"/> - <xsl:value-of select="$tagThird"/> - <xsl:value-of select="$tagFourth"/> :  <xsl:value-of select="$stringHere"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringNext"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringThird"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringFourth"/> 
        </xsl:if>
        
    </xsl:template>
</xsl:stylesheet>
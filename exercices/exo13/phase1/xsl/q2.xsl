<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Var Globale -->
    <!-- 1 --> <xsl:variable name="var1" select="'NOM'"/> <!-- 2 --> <xsl:variable name="var2" select="'ADJ'"/>
    <!-- 3 --> <xsl:variable name="var3" select="'VER'"/> <!-- 4 --> <xsl:variable name="var4" select="'PRP'"/>
    <!-- 5  --> <xsl:variable name="var5" select="'ADV'"/>

    <!--
        SCHÉMA GLOBAL
    -->
    
    <xsl:template match="/">
            
        <!-- Transfo1 : NOM -->
        <xsl:result-document  method="text" href="./extraction-q2/1var_{$var1}.txt">
            ------- <xsl:value-of select="$var1"/> ------- 
            <xsl:apply-templates select="//element" mode="oneVar"/>
        </xsl:result-document>
        
        <!-- Transfo2 : NOM - ADJ -->    
        <xsl:result-document  method="text" href="./extraction-q2/2var_{$var1}_{$var2}.txt">
            ------- <xsl:value-of select="$var1"/> - <xsl:value-of select="$var2"/> ------- 
            <xsl:apply-templates select="//element" mode="twoVar"/>
        </xsl:result-document>  
        
        <!-- Transfo3 : NOM - PRP - NOM -->
        <xsl:result-document  method="text" href="./extraction-q2/3var_{$var1}_{$var4}_{$var1}.txt">
            ------- <xsl:value-of select="$var1"/> - <xsl:value-of select="$var4"/> - <xsl:value-of select="$var1"/>  ------- 
            <xsl:apply-templates select="//element" mode="threeVar"/>
        </xsl:result-document>

        <!-- Transfo4 : NOM - PRP - NOM - ADJ -->
        <xsl:result-document  method="text" href="./extraction-q2/4var_{$var2}_{$var1}_{$var4}_{$var1}.txt">
            ------- <xsl:value-of select="$var2"/> - <xsl:value-of select="$var1"/> - <xsl:value-of select="$var4"/> - <xsl:value-of select="$var1"/>  ------- 
            <xsl:apply-templates select="//element" mode="fourVar"/>
        </xsl:result-document>
        
    </xsl:template>

    <!--
        LES EXTRACTIONS
    -->
    
    <!-- One var -->
    <xsl:template match="element" mode="oneVar">
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./data[1]"/>
        <xsl:variable name="lemmaHere" select="./data[2]"/>
        <xsl:variable name="stringHere" select="./data[3]"/>
    
        
    <!-- NOM -->
    <xsl:if test="($tagHere[contains(text(),$var1)])">
    - <xsl:value-of select="$tagHere"/> : <xsl:value-of select="$stringHere"/>
    </xsl:if>
     
        </xsl:template>
    
    <!-- Two var -->
    <xsl:template match="element" mode="twoVar">
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./data[1]"/>
        <xsl:variable name="lemmaHere" select="./data[2]"/>
        <xsl:variable name="stringHere" select="./data[3]"/>
        
        <!-- Niveau 2 -->
        <xsl:variable name="tagNext" select="following-sibling::element[1]/data[1]"/>
        <xsl:variable name="lemmaNext" select="following-sibling::element[1]/data[2]"/>
        <xsl:variable name="stringNext" select="following-sibling::element[1]/data[3]"/>
        
        <!-- 
        Rappel :
            var1 = NOM, var2 = ADJ , var3 = VERB, var4 = PRP , var5 = ADV,
    -->
        
        <!-- NOM - ADJ -->
    <xsl:if test="($tagHere[contains(text(),$var1)]) and ($tagNext[contains(text(), $var2)])">
    - <xsl:value-of select="$tagHere"/> - <xsl:value-of select="$tagNext"/> : <xsl:value-of select="$stringHere"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringNext"/> 
    </xsl:if>
        
    </xsl:template>
    
    <!-- Three var -->
    <xsl:template match="element" mode="threeVar">
    
    <!-- Niveau 1 -->
    <xsl:variable name="tagHere" select="./data[1]"/>
    <xsl:variable name="lemmaHere" select="./data[2]"/>
    <xsl:variable name="stringHere" select="./data[3]"/>
    
    <!-- Niveau 2 -->
    <xsl:variable name="tagNext" select="following-sibling::element[1]/data[1]"/>
    <xsl:variable name="lemmaNext" select="following-sibling::element[1]/data[2]"/>
    <xsl:variable name="stringNext" select="following-sibling::element[1]/data[3]"/>
    
    <!-- Niveau 3 -->
    <xsl:variable name="tagThird" select="following-sibling::element[2]/data[1]"/>
    <xsl:variable name="lemmaThird" select="following-sibling::element[2]/data[2]"/>
    <xsl:variable name="stringThird" select="following-sibling::element[2]/data[3]"/>
    
    <!-- 
Rappel :
    var1 = NOM, var2 = ADJ , var3 = VERB, var4 = PRP , var5 = ADV,
-->
        
<!-- NOM - PRP - NOM -->
<xsl:if test="($tagHere[contains(text(),$var1)]) and ($tagNext[contains(text(), $var4)]) and ($tagThird[contains(text(), $var1)])">
- <xsl:value-of select="$tagHere"/> - <xsl:value-of select="$tagNext"/> - <xsl:value-of select="$tagThird"/> :  <xsl:value-of select="$stringHere"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringNext"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringThird"/> 
</xsl:if>

</xsl:template>

    <!-- Four var -->
    <xsl:template match="element" mode="fourVar">
        
        <!-- Niveau 1 -->
        <xsl:variable name="tagHere" select="./data[1]"/>
        <xsl:variable name="lemmaHere" select="./data[2]"/>
        <xsl:variable name="stringHere" select="./data[3]"/>
        
        <!-- Niveau 2 -->
        <xsl:variable name="tagNext" select="following-sibling::element[1]/data[1]"/>
        <xsl:variable name="lemmaNext" select="following-sibling::element[1]/data[2]"/>
        <xsl:variable name="stringNext" select="following-sibling::element[1]/data[3]"/>
        
        <!-- Niveau 3 -->
        <xsl:variable name="tagThird" select="following-sibling::element[2]/data[1]"/>
        <xsl:variable name="lemmaThird" select="following-sibling::element[2]/data[2]"/>
        <xsl:variable name="stringThird" select="following-sibling::element[2]/data[3]"/>
        
        <!-- Niveau 4 -->
        <xsl:variable name="tagFourth" select="following-sibling::element[3]/data[1]"/>
        <xsl:variable name="lemmaFourth" select="following-sibling::element[3]/data[2]"/>
        <xsl:variable name="stringFourth" select="following-sibling::element[3]/data[3]"/>
        
        <!-- 
Rappel :
    var1 = NOM, var2 = ADJ , var3 = VERB, var4 = PRP , var5 = ADV,
-->
        
        <!-- NOM - PRP - NOM - ADJ -->
        <xsl:if test="($tagHere[contains(text(),$var2)]) and ($tagNext[contains(text(), $var1)]) and ($tagThird[contains(text(), $var4)]) and ($tagFourth[contains(text(), $var1)])">
            - <xsl:value-of select="$tagHere"/> - <xsl:value-of select="$tagNext"/> - <xsl:value-of select="$tagThird"/> - <xsl:value-of select="$tagFourth"/> :  <xsl:value-of select="$stringHere"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringNext"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringThird"/> <xsl:text> </xsl:text> <xsl:value-of select="$stringFourth"/> 
        </xsl:if>
        
    </xsl:template>
</xsl:stylesheet>
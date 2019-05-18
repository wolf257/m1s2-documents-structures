<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/TEI">

			<xsl:variable name="linebreak">
			<xsl:text>
</xsl:text>
			</xsl:variable>

			<xsl:variable name="elementName2">
				<xsl:choose>
                <xsl:when test="contains(/TEI/text/body/div/head, 'partie=')">
                    <xsl:value-of select="substring-after(/TEI/text/body/div/head, 'partie=')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="/TEI/text/body/div/head"/>
                </xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="elementName1">
			<xsl:call-template name="replace-string">
					<xsl:with-param name="text" select="$elementName2"/>
					<xsl:with-param name="replace" select="$linebreak" />
					<xsl:with-param name="with" select="''"/>
			 </xsl:call-template>
            </xsl:variable>

			<xsl:variable name="elementName">
			<xsl:value-of select="translate($elementName1, '&#xA;|&#xD;', '')" />
			</xsl:variable>

			<div id="voletTEI">
			<h1 align="center">COPIE Format TEI </h1>
			<h3 align="center">Affichage : Opérations de réécriture + annotations</h3>
				<blockquote><p align="center"><small>Grille de lecture : <span style="background-color:#ffff66;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;">suppression</span><xsl:text> </xsl:text><span style="background-color:#ff9933;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><u>soulignement</u></span><xsl:text> </xsl:text><span style="background-color:#66ccff;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;">insertion</span><xsl:text> </xsl:text><span style="background-color:#999933;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><b>&lt;</b>anno | tation<b>&gt;</b></span><xsl:text> </xsl:text><span style="background-color:#99ff33;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><b>&lt;</b>rempla || cement<b>&gt;</b></span></small></p>
				</blockquote>
			<div id="voletTEIcontent">
			<blockquote>
				<xsl:apply-templates select="text/body/*"/>
			</blockquote>
			</div>
			<p align="center"><a href="{$elementName}-tei-1.html"  class="next">Voir sans annotations</a></p>
			</div>
</xsl:template>

<xsl:template match="div[@type='preface']">
		<h3>Prefacia</h3><font type="arial"><xsl:apply-templates/></font>
</xsl:template>
	
<xsl:template match="head">
				<h3><xsl:choose>
                <xsl:when test="contains(., 'partie=')">
                    <xsl:value-of select="substring-after(., 'partie=')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
				</xsl:choose></h3>
</xsl:template>

<xsl:template match="quote">
		<div class="quote"><i><xsl:apply-templates/></i></div>
</xsl:template>

<xsl:template match="list[@type=numbered]">
		<ol><xsl:apply-templates/></ol>
</xsl:template>

<xsl:template match="list">
		<ul><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="item">
		<li><xsl:apply-templates/></li>
</xsl:template>


<xsl:template match="p">
		<p align="justify"><xsl:apply-templates/></p>
</xsl:template>
<xsl:template match="l">
		<p align="center"><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="pb">
		<p align="justify">--------------------------------------------</p>
</xsl:template>


<xsl:template match="mod[@type='corr']">
		<span style="background-color:#999933;"><b>&lt;</b><xsl:apply-templates select="orig"/><xsl:text> | </xsl:text><xsl:apply-templates select="reg"/><b>&gt;</b></span>
</xsl:template>

<xsl:template match="orig">
		<xsl:apply-templates/>
</xsl:template>
<xsl:template match="reg">
		<xsl:apply-templates/>
</xsl:template>


<xsl:template match="del">
		<span style="background-color:#ffff66;"><xsl:apply-templates/> </span>
</xsl:template>

<xsl:template match="add">
		<span style="background-color:#66ccff;"><xsl:apply-templates/></span>
</xsl:template>

<xsl:template match="hi">
		<span style="background-color:#ff9933"><u><xsl:value-of select="."/></u></span>
</xsl:template>


<xsl:template match="mod[@type='subst']">
		<span style="background-color:#99ff33"><b>&lt;</b><xsl:apply-templates select="del"/><xsl:text> || </xsl:text><span style="background-color:#66ccff;"><xsl:apply-templates select="add"/></span><b>&gt;</b></span>
		
</xsl:template>

<xsl:template match="hi[@rend='M']">
		<span><xsl:apply-templates/></span>
</xsl:template>
<xsl:template match="hi[@rend='I']">
		<i><xsl:apply-templates/></i>
</xsl:template>
<xsl:template match="hi[@rend='G']">
		<b><xsl:apply-templates/></b>
</xsl:template>

<xsl:template match="structure">
		<xsl:element name="a">
		  <xsl:attribute name="name">
			<xsl:value-of select="@id"/>
		  </xsl:attribute>
			<font color="red">[s]</font>
	   </xsl:element>
</xsl:template>

<xsl:template name="replace-string">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
        <xsl:when test="contains($text,$replace)">
            <xsl:value-of select="substring-before($text,$replace)"/>
            <xsl:value-of select="$with"/>
            <xsl:call-template name="replace-string">
                <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                <xsl:with-param name="replace" select="$replace"/>
                <xsl:with-param name="with" select="$with"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$text"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UFT-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/TEI">
	<html>
		<head>
			<title>
				<xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>
			</title>
			<style type="text/css">
				body {
				  padding: 1em 1em 1em 1em;
				  margin: 0;
				  font-family: sans-serif;
				  font-size: normal;
				  color: black;
				  background: white;
				  background-position: top left;
				  background-attachment: fixed;
				  background-repeat: no-repeat;
				  text-align: justify;
				}
				/*h1, h2, h3, h4, h5, h6 { text-align: left }*/
				/* background should be transparent, but WebTV has a bug */
				h1, h2, h3, h4 { color: #005A9C }
				h1 { font: 170% sans-serif }
				h2 { font: 150% sans-serif }
				h3 { font: 130% sans-serif }
				h4 { font: bold 110% sans-serif }
				h5 { font: italic 110% sans-serif }
				h6 { font: small-caps 110% sans-serif }
				p {
				  margin-top: 1%;
				  margin-bottom: 0.1em;
				}
				span { font: small-caps }
				.quote {  
				  margin-right: 10%;
				  margin-left: 10%;
				  padding: 10px;
				  color: gray;
				}
			</style>
		</head>
		<body>
		   <p align="center"><img src="bandeau-ecriscol.gif"/></p>
			<h1 align="center">COPIE Format TEI</h1>
			<h2 align="center">http://www.univ-paris3.fr/ecriscol</h2>
			
				<blockquote><p align="center"><small>Grille de lecture : <span style="background-color:#ffff66;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:105%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;">suppression</span><xsl:text> </xsl:text><span style="background-color:#ff9933;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:105%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><u>soulignement</u></span><xsl:text> </xsl:text><span style="background-color:#66ccff;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:105%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;">insertion</span><xsl:text> </xsl:text><span style="background-color:#999933;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:105%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><b>&lt;</b>anno | tation<b>&gt;</b></span><xsl:text> </xsl:text><span style="background-color:#99ff33;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:105%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><b>&lt;</b>rempla || cement<b>&gt;</b></span></small></p>
				</blockquote>
			<br/>
			<div style="text-align:justify;border: 2pt solid #00628B ; padding: 4pt; width:600;margin-left:50px; margin-right: 50px;">
			
			<blockquote>
				<xsl:apply-templates select="text/body/*"/>
			</blockquote>
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template match="div[@type='preface']">
		<h3>Prefacia</h3><font type="arial"><xsl:apply-templates/></font>
</xsl:template>
	
<xsl:template match="head">
		<h3><xsl:apply-templates/></h3>
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


<xsl:template match="annotation">
		<span style="background-color:#999933;"><b>&lt;</b><xsl:apply-templates select="b"/><xsl:text> | </xsl:text><xsl:apply-templates select="a"/><b>&gt;</b></span>
</xsl:template>

<xsl:template match="a">
		<xsl:apply-templates/>
</xsl:template>
<xsl:template match="b">
		<xsl:apply-templates/>
</xsl:template>


<xsl:template match="del">
		<span style="background-color:#ffff66;"><xsl:value-of select="."/> </span>
</xsl:template>

<xsl:template match="ins">
		<span style="background-color:#66ccff;"><xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="soulignement">
		<span style="background-color:#ff9933"><u><xsl:value-of select="."/></u></span>
</xsl:template>

<xsl:template match="remplacement">
		<span style="background-color:#99ff33"><b>&lt;</b><xsl:apply-templates select="b"/><xsl:text> || </xsl:text><xsl:apply-templates select="a"/><b>&gt;</b></span>
		
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

</xsl:stylesheet>

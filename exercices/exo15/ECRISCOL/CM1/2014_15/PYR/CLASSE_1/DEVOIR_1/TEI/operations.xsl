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
			<h3 align="center">Affichage : Opérations de réécriture</h3>
				
				<blockquote>
				<p align="center">
				<span style="font-size:11px"><b>Grille de lecture</b> : <br/>
				<span style="font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><span style="text-decoration: none;border-bottom: 2px solid red;">soulignement</span></span><xsl:text>    </xsl:text><span style="background-color:#ffff66;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;">suppression</span><input type="checkbox" name="checkSuppression" id="checkSuppression" checked="true" onclick="showHideSuppression();"/><xsl:text> </xsl:text><span style="background-color:#66ccff;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;">insertion</span><input type="checkbox" name="checkInsertion" id="checkInsertion" checked="true" onclick="showHideInsertion();"/><xsl:text> </xsl:text>
				<span style="background-color:#99ff33;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><b>&lt;</b>rempla || cement<b>&gt;</b></span><input type="checkbox" name="checkRemplacement" id="checkRemplacement" checked="true" onclick="showHideRemplacement();"/><xsl:text> </xsl:text><span style="background-color:#999933;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;"><b>&lt;</b>annotation<b>&gt;</b></span><input type="checkbox" name="checkAnnotation" id="checkAnnotation" onclick="showHideAnnotation();"/><xsl:text> </xsl:text>
				<span style="background-color:#f08494;font-family:arial,helvetica,sans-serif;font-variant:small-caps;font-size:95%;padding:2px;border-right:1px solid #C90;border-bottom:1px solid #C90;">commentaire</span><input type="checkbox" name="checkCommentaire" id="checkCommentaire" checked="true" onclick="showHideCommentaire();"/></span></p>
				<p align="center" ><span style="font-size:10px"><u>Cocher/décocher pour masquer/afficher l'opération</u></span>
				</p>
				</blockquote>
				
			<p id="menu"></p>
			
			<div id="voletTEIcontent">
			<blockquote>
				<xsl:apply-templates select="text/body/*"/>
			
			<br/><hr class="findepage"/><br/><br/><br/><br/>
			</blockquote>
			
			</div>
			
			<br/>
			</div>
			<br/>
</xsl:template>

<xsl:template match="div[@type='preface']">
		<h3>Prefacia</h3><font type="arial"><xsl:apply-templates/></font>
</xsl:template>
	
<xsl:template match="head">
				<h1><xsl:choose>
                <xsl:when test="contains(., 'partie=')">
                    <xsl:value-of select="substring-after(., 'partie=')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
				</xsl:choose></h1>
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

<xsl:template match="pb"><p align="center"><br/><br/><hr class="findepage"/><br/><br/><br/><br/></p>
</xsl:template>

<!-- annotation -->
<xsl:template match="mod[@type='corr']">
		<xsl:if test="(@stage != '') or (@who != '')">
		<sup><span style="background:black;color:white"><xsl:value-of select="@stage"/><xsl:value-of select="@who"/></span></sup>
		</xsl:if>
		<xsl:apply-templates select="orig"/><span class="showHideAnnotation" style="display:none;background-color:#999933;"><b><xsl:text> &lt;</xsl:text></b><xsl:apply-templates select="reg"/><b><xsl:text>&gt; </xsl:text></b></span>
</xsl:template>
<xsl:template match="orig">
		<xsl:apply-templates/>
</xsl:template>
<xsl:template match="reg">
		<xsl:apply-templates/>
</xsl:template>
<!-- suppression -->
<xsl:template match="mod[@type='del']">
		<xsl:if test="(@stage != '') or (@who != '')">
		<sup><span style="background:black;color:white"><xsl:value-of select="@stage"/><xsl:value-of select="@who"/></span></sup>
		</xsl:if>
		<xsl:apply-templates/>
</xsl:template>
<xsl:template match="del">
		<span class="showHideSuppression">
		<xsl:if test="(@stage != '') or (@who != '')">
		<sup><span style="background:black;color:white"><xsl:value-of select="@stage"/><xsl:value-of select="@who"/></span></sup>
		</xsl:if><span style="background-color:#ffff66;"><xsl:apply-templates/> </span></span>
</xsl:template>
<!-- insertion -->
<xsl:template match="add">
		<xsl:if test="(@stage != '') or (@who != '')">
		<sup><span style="background:black;color:white"><xsl:value-of select="@stage"/><xsl:value-of select="@who"/></span></sup>
		</xsl:if>
		<span style="background-color:#66ccff;"><xsl:apply-templates/></span>
</xsl:template>
<xsl:template match="mod[@type='add']">
		<span class="showHideInsertion">
		<xsl:if test="(@stage != '') or (@who != '')">
		<sup><span style="background:black;color:white"><xsl:value-of select="@stage"/><xsl:value-of select="@who"/></span></sup>
		</xsl:if>
		<xsl:apply-templates/>
		</span>
</xsl:template>
<!-- substitution -->
<xsl:template match="mod[@type='subst']">
		<!--<span style="background-color:#66ccff;">-->
		<span style="background-color:#99ff33"><b>&lt;</b>
		<span class="showHideRemplacement">
		<xsl:if test="(@stage != '') or (@who != '')">
		<sup><span style="background:black;color:white"><xsl:value-of select="@stage"/><xsl:value-of select="@who"/></span></sup>
		</xsl:if>
		<xsl:apply-templates select="del"/><xsl:text>||</xsl:text></span>
		<xsl:apply-templates select="add"/>
		<b>&gt;</b></span>
		<!--</span>-->
</xsl:template>
<!-- commentaire -->
<xsl:template match="metamark">
		<span class="showHideCommentaire"><xsl:text> </xsl:text><sup><span style="background:red;color:black"><xsl:value-of select="@time"/><xsl:value-of select="@who"/></span></sup><span style="background-color:#f08494"><xsl:apply-templates/></span><xsl:text> </xsl:text></span>
</xsl:template>
<!-- divers -->
<xsl:template match="hi">
		<span style="text-decoration: none;border-bottom: 2px solid red;"><xsl:apply-templates/></span>
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

<xsl:template match="lb">
		<br/><xsl:text>
</xsl:text>
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

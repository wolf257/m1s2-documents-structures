<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
 <xsl:template match="/">
     <html>
         
         <!-- HEAD -->
         <head>
             <title> <xsl:value-of select="exercice/infoPage/titrePage"/> </title>
             <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"></link>
             <link rel="stylesheet" text="text/css" href="../css/style.css"></link>             
         </head>
         
         
         <!-- BODY -->
         <body>

            <h class="tete">Documents structurés</h>
            <h4 class="tete">Ousseynou Gueye &amp; Sandy Duchemin</h4>
            <h4 class="tete">M1 TAL - 2018/2019</h4>
             <!-- Menu -->
             <div class="corps">
             <ul id="menu">
                 <li><a href="../index.xml">Accueil</a> </li>
                 <li> <a href="../exercices/exo1.xml"> 1 </a></li>
                 <li> <a href="../exercices/exo2.xml"> 2 </a></li>
                 <li> <a href="../exercices/exo3.xml"> 3 </a></li>
                 <li> <a href="../exercices/exo6.xml"> 6 </a></li>
                 <li> <a href="../exercices/exo7.xml"> 7 </a></li>
                 <li> <a href="../exercices/exo9.xml"> 9 </a></li>
                 <li> <a href="../exercices/exo11.xml"> 11 </a></li>
                 <li> <a href="../exercices/exo13.xml"> 13 </a></li> 
                 <li> <a href="../exercices/exo15.xml"> 15 </a></li>             
                 <li> <a href="../exercices/exo16.xml"> 16 </a></li>
             </ul>
             
            <!-- INFO GENERALE EXO -->
             <h1> <xsl:value-of select="exercice/infoExo/titreExo"/> </h1>
             
             <xsl:if test="//infoExo/sousTitrePerso"> <!-- ce n'est que si le titre m'inspire :-) -->
                 <h2> <xsl:value-of select="exercice/infoExo/sousTitrePerso"/> </h2>
             </xsl:if>
            
            
            <!-- Pour chaque question -->
            <xsl:for-each select="//question">
                
                <!-- TO PRINT OR NOT 'Question num' -->
                <xsl:if test="count(../question) &gt; 1">
                    <h3> Question <xsl:value-of select="./@index"/> </h3>
                </xsl:if>
                
                <!-- bloc -->
                <xsl:for-each select="./bloc">
                    <h4> <xsl:value-of select="./titre"/> </h4>
                    
                    <!-- Si bloc contient un commentaire -->
                    <xsl:if test="./commentaire">
                        <xsl:for-each select="./commentaire/ligne">
                            <p> <xsl:value-of select="./text()"/> </p>
                        </xsl:for-each>
                    </xsl:if>
                    
                    <!-- Si Image -->
                    
                    <xsl:for-each select="./pathimage">
                        <xsl:element name="img">
                            <xsl:attribute name="src"> <xsl:value-of select="."/> </xsl:attribute>
                            
                            <xsl:attribute name="style"> width:75%; height:75%; </xsl:attribute>
                        </xsl:element>
                        <xsl:text> . </xsl:text>
                    </xsl:for-each>
                    
                    <!-- Si tableau -->
                    <xsl:if test="./tableau">
                        <table>
                        <xsl:for-each select="./tableau/ligne_t">
                            <tr>
                                <td>
                                    <xsl:value-of select="@index"/>
                                </td>
                                
                            <xsl:for-each select="./colonne">
                                
                                <xsl:choose>
                                    
                                    <xsl:when test="@lien">
                                        <!-- cellule avec lien -->
                                        <td>
                                            
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="@lien"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="target">_blank</xsl:attribute>
                                                <xsl:value-of select="text()"/>
                                            </xsl:element>
                                            
                                        </td>
                                    </xsl:when>
                                    
                                    <xsl:otherwise>
                                        <!-- cellule sans lien -->
                                        <td>
                                            <xsl:value-of select="text()"/>
                                        </td>
                                    </xsl:otherwise>
                                    
                                </xsl:choose>

                            </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                        </table>
                    </xsl:if>

                </xsl:for-each>  <!-- /bloc -->         
                
                <!-- Si code -->
                <xsl:if test="./code">
                    <div class="linkCode">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="./code/pathZip"/>
                            </xsl:attribute>
                            <xsl:attribute name="download"></xsl:attribute>
                            Télécharger les fichiers
                        </xsl:element>
                    </div>

                </xsl:if>
                
            </xsl:for-each> <!-- /question -->
             
 
             <!-- RETOUR VERS TOP -->
             <div class="linkup"> <a href="#top"> Retour en haut de page </a> </div>
                          
             <!-- RETOUR VERS ACCUEIL -->
             <div class="linkup"> <a href="../index.xml"> Retour à la page d'accueil </a> </div>
             </div>
         </body>
     </html>
 </xsl:template>
    
    
    
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title> exercice_5_Q1</title>
            </head>
            
            <body>
                
                <h1> Exercice 5 - Q1</h1>
                
                <ul>
                    <li>
                      <strong> Auteur : </strong>
                      <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/author"/>
                    </li>
                  
                    <li>
                      <strong> Titre du poème : </strong>
                      <xsl:value-of select="TEI/text/group/text/front/head"/>
                    </li>
                  
                    <li>
                        <strong> Date de publication : </strong>
                        <xsl:value-of select="TEI/text/group/text/front/dateline"/>
                    </li>
                  
                    <li>
                        <strong> Recueil : </strong>
                        <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/>
                    </li>
                    
                </ul>
                
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>


<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/stockDomestico">
		<html>
			<head>
				<title/>
			</head>
			<body>
				<table border="1">
					<tr><th>Category</th><th>Investment</th></tr>
					<xsl:apply-templates select="dispensa/categorias/categoria"/>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="categoria">
		<tr><td><xsl:value-of select="nome"/></td>
			<xsl:variable name="total">
				<xsl:for-each select="artigos/artigo/nome[not(.=../preceding-sibling::artigo/nome)]">
					<node>
						<xsl:value-of select="//precos/artigo[nomeProduto = current()]/@preco * count(//artigos/artigo[nome = current()])"/>
					</node>
				</xsl:for-each>
			</xsl:variable>
			<td><xsl:value-of select="sum($total/node[. castable as xs:double])"/></td></tr>
	</xsl:template>
</xsl:stylesheet>
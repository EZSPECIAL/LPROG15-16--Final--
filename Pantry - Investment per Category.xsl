<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:pantry="http://isep.ipp.pt/1151007">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/pantry:Pantry">
		<html>
			<head>
				<title/>
			</head>
			<body>
				<table border="1">
					<tr><th>Category</th><th>Investment</th></tr>
					<xsl:apply-templates select="pantry:Categories/pantry:Category"/>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="pantry:Category">
		<tr><td><xsl:value-of select="pantry:CategoryName"/></td>
		<xsl:variable name="totals">
			<xsl:for-each select="pantry:Product/pantry:ProductName[not(.=../preceding-sibling::pantry:Product/pantry:ProductName)]">
				<node>
					<xsl:value-of select="//pantry:Price[pantry:PriceName = current()]/pantry:Value * count(//pantry:Product[pantry:ProductName = current()])"/>
				</node>
			</xsl:for-each>
		</xsl:variable>
		<td><xsl:value-of select="sum($totals/node[. castable as xs:decimal])"/></td></tr>
	</xsl:template>
</xsl:stylesheet>
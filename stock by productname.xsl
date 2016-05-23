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
			<tr><th>Product Name</th><th>Stock</th></tr>
				<xsl:for-each select="//pantry:ProductName[not(.=../preceding-sibling::pantry:Product/pantry:ProductName)]">
				<tr><td><xsl:value-of select="."/></td>
				<td><xsl:value-of select="sum(//pantry:Product[pantry:ProductName = current()]/pantry:Stock)"/></td></tr>
				</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- iWlz 2.1 CA317 (05/08/2019 16:02) -->

	<xsl:import href="common/basis.xsl" />
	<xsl:include href="condities/CD005.xsl" />
	<xsl:include href="condities/CD007.xsl" />
	<xsl:include href="condities/CD025.xsl" />
	<xsl:include href="condities/CD051.xsl" />
	<xsl:include href="condities/CD071.xsl" />
	<xsl:include href="condities/CD072.xsl" />
	<xsl:include href="constraints/CS002.xsl" />
	<xsl:include href="constraints/CS023.xsl" />
	<xsl:include href="constraints/CS074.xsl" />
	<xsl:include href="constraints/CS089.xsl" />
	<xsl:include href="constraints/CS125.xsl" />
	<xsl:include href="rules/TR002.xsl" />
	<xsl:include href="rules/TR097.xsl" />
	<xsl:include href="rules/TR101.xsl" />

	<xsl:template match="*" mode="check" priority="0">
		<xsl:apply-templates select="." mode="CD005"/>
		<xsl:apply-templates select="." mode="CD007"/>
		<xsl:apply-templates select="." mode="CD025"/>
		<xsl:apply-templates select="." mode="CD051"/>
		<xsl:apply-templates select="." mode="CD071"/>
		<xsl:apply-templates select="." mode="CD072"/>
		<xsl:apply-templates select="." mode="CS002"/>
		<xsl:apply-templates select="." mode="CS023"/>
		<xsl:apply-templates select="." mode="CS074"/>
		<xsl:apply-templates select="." mode="CS089"/>
		<xsl:apply-templates select="." mode="CS125"/>
		<xsl:apply-templates select="." mode="TR002"/>
		<xsl:apply-templates select="." mode="TR097"/>
		<xsl:apply-templates select="." mode="TR101"/>
	</xsl:template>
</xsl:stylesheet>
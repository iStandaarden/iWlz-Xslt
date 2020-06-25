<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vr="http://www.istandaarden.nl/validatie/1_1/rapport/schema">
	<!-- iWlz 2.2 CA319 (2020-06-17) -->

	<xsl:import href="common/basis.xsl" />
	<xsl:include href="condities/CD005.xsl" />
	<xsl:include href="condities/CD007.xsl" />
	<xsl:include href="condities/CD025.xsl" />
	<xsl:include href="constraints/CS002.xsl" />
	<xsl:include href="constraints/CS023.xsl" />
	<xsl:include href="constraints/CS067.xsl" />
	<xsl:include href="constraints/CS089.xsl" />
	<xsl:include href="constraints/CS125.xsl" />
	<xsl:include href="rules/TR097.xsl" />
	<xsl:include href="rules/TR101.xsl" />

	<xsl:template match="*" mode="check" priority="0">
		<xsl:apply-templates select="." mode="CD005"/>
		<xsl:apply-templates select="." mode="CD007"/>
		<xsl:apply-templates select="." mode="CD025"/>
		<xsl:apply-templates select="." mode="CS002"/>
		<xsl:apply-templates select="." mode="CS023"/>
		<xsl:apply-templates select="." mode="CS067"/>
		<xsl:apply-templates select="." mode="CS089"/>
		<xsl:apply-templates select="." mode="CS125"/>
		<xsl:apply-templates select="." mode="TR097"/>
		<xsl:apply-templates select="." mode="TR101"/>
	</xsl:template>

	<xsl:variable name="versionInfo">
		<vr:XSLTHeader>
			<vr:Standaard>iwlz</vr:Standaard>
			<vr:StandaardRelease>2.2</vr:StandaardRelease>
			<vr:XSLTVersie>2.1.1</vr:XSLTVersie>
		</vr:XSLTHeader>
	</xsl:variable>
</xsl:stylesheet>

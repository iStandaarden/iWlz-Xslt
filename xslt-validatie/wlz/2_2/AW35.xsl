<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vr="http://www.istandaarden.nl/validatie/1_1/rapport/schema">
	<!-- iWlz 2.2 AW35 (2020-06-17) -->

	<xsl:import href="common/basis.xsl" />
	<xsl:include href="condities/CD004.xsl" />
	<xsl:include href="condities/CD005.xsl" />
	<xsl:include href="condities/CD007.xsl" />
	<xsl:include href="condities/CD025.xsl" />
	<xsl:include href="condities/CD051.xsl" />
	<xsl:include href="condities/CD072.xsl" />
	<xsl:include href="constraints/CS002.xsl" />
	<xsl:include href="constraints/CS023.xsl" />
	<xsl:include href="constraints/CS058.xsl" />
	<xsl:include href="constraints/CS062.xsl" />
	<xsl:include href="constraints/CS074.xsl" />
	<xsl:include href="constraints/CS088.xsl" />
	<xsl:include href="constraints/CS089.xsl" />
	<xsl:include href="constraints/CS127.xsl" />
	<xsl:include href="rules/TR002.xsl" />
	<xsl:include href="rules/TR008.xsl" />
	<xsl:include href="rules/TR010.xsl" />
	<xsl:include href="rules/TR034.xsl" />
	<xsl:include href="rules/TR039.xsl" />
	<xsl:include href="rules/TR042.xsl" />
	<xsl:include href="rules/TR064.xsl" />
	<xsl:include href="rules/TR097.xsl" />
	<xsl:include href="rules/TR100.xsl" />
	<xsl:include href="rules/TR101.xsl" />

	<xsl:template match="*" mode="check" priority="0">
		<xsl:apply-templates select="." mode="CD004"/>
		<xsl:apply-templates select="." mode="CD005"/>
		<xsl:apply-templates select="." mode="CD007"/>
		<xsl:apply-templates select="." mode="CD025"/>
		<xsl:apply-templates select="." mode="CD051"/>
		<xsl:apply-templates select="." mode="CD072"/>
		<xsl:apply-templates select="." mode="CS002"/>
		<xsl:apply-templates select="." mode="CS023"/>
		<xsl:apply-templates select="." mode="CS058"/>
		<xsl:apply-templates select="." mode="CS062"/>
		<xsl:apply-templates select="." mode="CS074"/>
		<xsl:apply-templates select="." mode="CS088"/>
		<xsl:apply-templates select="." mode="CS089"/>
		<xsl:apply-templates select="." mode="CS127"/>
		<xsl:apply-templates select="." mode="TR002"/>
		<xsl:apply-templates select="." mode="TR008"/>
		<xsl:apply-templates select="." mode="TR010"/>
		<xsl:apply-templates select="." mode="TR034"/>
		<xsl:apply-templates select="." mode="TR039"/>
		<xsl:apply-templates select="." mode="TR042"/>
		<xsl:apply-templates select="." mode="TR064"/>
		<xsl:apply-templates select="." mode="TR097"/>
		<xsl:apply-templates select="." mode="TR100"/>
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

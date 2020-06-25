<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vr="http://www.istandaarden.nl/validatie/1_1/rapport/schema">
	<!-- iWlz 2.2 ZK39 (2020-06-17) -->

	<xsl:import href="common/basis.xsl" />
	<xsl:include href="condities/CD005.xsl" />
	<xsl:include href="condities/CD007.xsl" />
	<xsl:include href="condities/CD020.xsl" />
	<xsl:include href="condities/CD025.xsl" />
	<xsl:include href="condities/CD040.xsl" />
	<xsl:include href="condities/CD047.xsl" />
	<xsl:include href="condities/CD048.xsl" />
	<xsl:include href="condities/CD050.xsl" />
	<xsl:include href="condities/CD051.xsl" />
	<xsl:include href="condities/CD052.xsl" />
	<xsl:include href="condities/CD072.xsl" />
	<xsl:include href="condities/CD073.xsl" />
	<xsl:include href="condities/CD074.xsl" />
	<xsl:include href="constraints/CS002.xsl" />
	<xsl:include href="constraints/CS003.xsl" />
	<xsl:include href="constraints/CS023.xsl" />
	<xsl:include href="constraints/CS050.xsl" />
	<xsl:include href="constraints/CS058.xsl" />
	<xsl:include href="constraints/CS072.xsl" />
	<xsl:include href="constraints/CS074.xsl" />
	<xsl:include href="constraints/CS089.xsl" />
	<xsl:include href="constraints/CS127.xsl" />
	<xsl:include href="rules/TR002.xsl" />
	<xsl:include href="rules/TR018.xsl" />
	<xsl:include href="rules/TR040.xsl" />
	<xsl:include href="rules/TR041.xsl" />
	<xsl:include href="rules/TR042.xsl" />
	<xsl:include href="rules/TR046.xsl" />
	<xsl:include href="rules/TR064.xsl" />
	<xsl:include href="rules/TR066.xsl" />
	<xsl:include href="rules/TR097.xsl" />
	<xsl:include href="rules/TR101.xsl" />
	<xsl:include href="rules/TR106.xsl" />
	<xsl:include href="rules/TR120.xsl" />
	<xsl:include href="rules/TR127.xsl" />

	<xsl:template match="*" mode="check" priority="0">
		<xsl:apply-templates select="." mode="CD005"/>
		<xsl:apply-templates select="." mode="CD007"/>
		<xsl:apply-templates select="." mode="CD020"/>
		<xsl:apply-templates select="." mode="CD025"/>
		<xsl:apply-templates select="." mode="CD040"/>
		<xsl:apply-templates select="." mode="CD047"/>
		<xsl:apply-templates select="." mode="CD048"/>
		<xsl:apply-templates select="." mode="CD050"/>
		<xsl:apply-templates select="." mode="CD051"/>
		<xsl:apply-templates select="." mode="CD052"/>
		<xsl:apply-templates select="." mode="CD072"/>
		<xsl:apply-templates select="." mode="CD073"/>
		<xsl:apply-templates select="." mode="CD074"/>
		<xsl:apply-templates select="." mode="CS002"/>
		<xsl:apply-templates select="." mode="CS003"/>
		<xsl:apply-templates select="." mode="CS023"/>
		<xsl:apply-templates select="." mode="CS050"/>
		<xsl:apply-templates select="." mode="CS058"/>
		<xsl:apply-templates select="." mode="CS072"/>
		<xsl:apply-templates select="." mode="CS074"/>
		<xsl:apply-templates select="." mode="CS089"/>
		<xsl:apply-templates select="." mode="CS127"/>
		<xsl:apply-templates select="." mode="TR002"/>
		<xsl:apply-templates select="." mode="TR018"/>
		<xsl:apply-templates select="." mode="TR040"/>
		<xsl:apply-templates select="." mode="TR041"/>
		<xsl:apply-templates select="." mode="TR042"/>
		<xsl:apply-templates select="." mode="TR046"/>
		<xsl:apply-templates select="." mode="TR064"/>
		<xsl:apply-templates select="." mode="TR066"/>
		<xsl:apply-templates select="." mode="TR097"/>
		<xsl:apply-templates select="." mode="TR101"/>
		<xsl:apply-templates select="." mode="TR106"/>
		<xsl:apply-templates select="." mode="TR120"/>
		<xsl:apply-templates select="." mode="TR127"/>
	</xsl:template>

	<xsl:variable name="versionInfo">
		<vr:XSLTHeader>
			<vr:Standaard>iwlz</vr:Standaard>
			<vr:StandaardRelease>2.2</vr:StandaardRelease>
			<vr:XSLTVersie>2.1.1</vr:XSLTVersie>
		</vr:XSLTHeader>
	</xsl:variable>
</xsl:stylesheet>

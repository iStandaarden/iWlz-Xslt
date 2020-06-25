<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vr="http://www.istandaarden.nl/validatie/1_1/rapport/schema">
	<!-- iWlz 2.2 AW317 (2020-06-17) -->

	<xsl:import href="common/basis.xsl" />
	<xsl:include href="condities/CD005.xsl" />
	<xsl:include href="condities/CD007.xsl" />
	<xsl:include href="condities/CD025.xsl" />
	<xsl:include href="condities/CD029.xsl" />
	<xsl:include href="condities/CD036.xsl" />
	<xsl:include href="condities/CD040.xsl" />
	<xsl:include href="condities/CD052.xsl" />
	<xsl:include href="condities/CD072.xsl" />
	<xsl:include href="constraints/CS002.xsl" />
	<xsl:include href="constraints/CS003.xsl" />
	<xsl:include href="constraints/CS012.xsl" />
	<xsl:include href="constraints/CS014.xsl" />
	<xsl:include href="constraints/CS023.xsl" />
	<xsl:include href="constraints/CS050.xsl" />
	<xsl:include href="constraints/CS072.xsl" />
	<xsl:include href="constraints/CS074.xsl" />
	<xsl:include href="constraints/CS089.xsl" />
	<xsl:include href="constraints/CS092.xsl" />
	<xsl:include href="constraints/CS093.xsl" />
	<xsl:include href="constraints/CS108.xsl" />
	<xsl:include href="constraints/CS118.xsl" />
	<xsl:include href="rules/TR079.xsl" />
	<xsl:include href="rules/TR091.xsl" />
	<xsl:include href="rules/TR097.xsl" />
	<xsl:include href="rules/TR101.xsl" />

	<xsl:template match="*" mode="check" priority="0">
		<xsl:apply-templates select="." mode="CD005"/>
		<xsl:apply-templates select="." mode="CD007"/>
		<xsl:apply-templates select="." mode="CD025"/>
		<xsl:apply-templates select="." mode="CD029"/>
		<xsl:apply-templates select="." mode="CD036"/>
		<xsl:apply-templates select="." mode="CD040"/>
		<xsl:apply-templates select="." mode="CD052"/>
		<xsl:apply-templates select="." mode="CD072"/>
		<xsl:apply-templates select="." mode="CS002"/>
		<xsl:apply-templates select="." mode="CS003"/>
		<xsl:apply-templates select="." mode="CS012"/>
		<xsl:apply-templates select="." mode="CS014"/>
		<xsl:apply-templates select="." mode="CS023"/>
		<xsl:apply-templates select="." mode="CS050"/>
		<xsl:apply-templates select="." mode="CS072"/>
		<xsl:apply-templates select="." mode="CS074"/>
		<xsl:apply-templates select="." mode="CS089"/>
		<xsl:apply-templates select="." mode="CS092"/>
		<xsl:apply-templates select="." mode="CS093"/>
		<xsl:apply-templates select="." mode="CS108"/>
		<xsl:apply-templates select="." mode="CS118"/>
		<xsl:apply-templates select="." mode="TR079"/>
		<xsl:apply-templates select="." mode="TR091"/>
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

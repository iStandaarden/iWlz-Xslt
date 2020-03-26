<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:r="http://www.istandaarden.nl/validatie/1_1/rapport/schema">
	<!-- iWlz 2.1 IO31 (2020-03-25) -->

	<xsl:import href="common/basis.xsl" />
	<xsl:include href="condities/CD005.xsl" />
	<xsl:include href="condities/CD007.xsl" />
	<xsl:include href="condities/CD009.xsl" />
	<xsl:include href="condities/CD016.xsl" />
	<xsl:include href="condities/CD017.xsl" />
	<xsl:include href="condities/CD022.xsl" />
	<xsl:include href="condities/CD025.xsl" />
	<xsl:include href="condities/CD029.xsl" />
	<xsl:include href="condities/CD034.xsl" />
	<xsl:include href="condities/CD070.xsl" />
	<xsl:include href="constraints/CS002.xsl" />
	<xsl:include href="constraints/CS003.xsl" />
	<xsl:include href="constraints/CS014.xsl" />
	<xsl:include href="constraints/CS023.xsl" />
	<xsl:include href="constraints/CS035.xsl" />
	<xsl:include href="constraints/CS050.xsl" />
	<xsl:include href="constraints/CS069.xsl" />
	<xsl:include href="constraints/CS074.xsl" />
	<xsl:include href="constraints/CS089.xsl" />
	<xsl:include href="constraints/CS092.xsl" />
	<xsl:include href="constraints/CS107.xsl" />
	<xsl:include href="constraints/CS113.xsl" />
	<xsl:include href="constraints/CS123.xsl" />
	<xsl:include href="rules/TR002.xsl" />
	<xsl:include href="rules/TR004.xsl" />
	<xsl:include href="rules/TR005.xsl" />
	<xsl:include href="rules/TR006.xsl" />
	<xsl:include href="rules/TR008.xsl" />
	<xsl:include href="rules/TR010.xsl" />
	<xsl:include href="rules/TR014.xsl" />
	<xsl:include href="rules/TR015.xsl" />
	<xsl:include href="rules/TR034.xsl" />
	<xsl:include href="rules/TR035.xsl" />
	<xsl:include href="rules/TR057.xsl" />
	<xsl:include href="rules/TR061.xsl" />
	<xsl:include href="rules/TR097.xsl" />
	<xsl:include href="rules/TR101.xsl" />

	<xsl:template match="*" mode="check" priority="0">
		<xsl:apply-templates select="." mode="CD005"/>
		<xsl:apply-templates select="." mode="CD007"/>
		<xsl:apply-templates select="." mode="CD009"/>
		<xsl:apply-templates select="." mode="CD016"/>
		<xsl:apply-templates select="." mode="CD017"/>
		<xsl:apply-templates select="." mode="CD022"/>
		<xsl:apply-templates select="." mode="CD025"/>
		<xsl:apply-templates select="." mode="CD029"/>
		<xsl:apply-templates select="." mode="CD034"/>
		<xsl:apply-templates select="." mode="CD070"/>
		<xsl:apply-templates select="." mode="CS002"/>
		<xsl:apply-templates select="." mode="CS003"/>
		<xsl:apply-templates select="." mode="CS014"/>
		<xsl:apply-templates select="." mode="CS023"/>
		<xsl:apply-templates select="." mode="CS035"/>
		<xsl:apply-templates select="." mode="CS050"/>
		<xsl:apply-templates select="." mode="CS069"/>
		<xsl:apply-templates select="." mode="CS074"/>
		<xsl:apply-templates select="." mode="CS089"/>
		<xsl:apply-templates select="." mode="CS092"/>
		<xsl:apply-templates select="." mode="CS107"/>
		<xsl:apply-templates select="." mode="CS113"/>
		<xsl:apply-templates select="." mode="CS123"/>
		<xsl:apply-templates select="." mode="TR002"/>
		<xsl:apply-templates select="." mode="TR004"/>
		<xsl:apply-templates select="." mode="TR005"/>
		<xsl:apply-templates select="." mode="TR006"/>
		<xsl:apply-templates select="." mode="TR008"/>
		<xsl:apply-templates select="." mode="TR010"/>
		<xsl:apply-templates select="." mode="TR014"/>
		<xsl:apply-templates select="." mode="TR015"/>
		<xsl:apply-templates select="." mode="TR034"/>
		<xsl:apply-templates select="." mode="TR035"/>
		<xsl:apply-templates select="." mode="TR057"/>
		<xsl:apply-templates select="." mode="TR061"/>
		<xsl:apply-templates select="." mode="TR097"/>
		<xsl:apply-templates select="." mode="TR101"/>
	</xsl:template>

	<xsl:variable name="versionInfo">
		<r:XSLTHeader>
			<r:Standaard>iwlz</r:Standaard>
			<r:StandaardRelease>2.1</r:StandaardRelease>
			<r:XSLTVersie>1.9.19</r:XSLTVersie>
		</r:XSLTHeader>
	</xsl:variable>
</xsl:stylesheet>

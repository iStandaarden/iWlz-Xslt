<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
				xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
				xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
				xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
				xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
>
	<!-- iWlz 2.2 TR106 version 2.1.4 (2020-07-08) -->

	<xsl:import href="../common/basis.xsl"/>
	<xsl:template match="*" mode="TR106"/>
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR106"/>
	</xsl:template>

	<xsl:template match="aw33:ToegewezenFunctie" mode="TR106">
		<xsl:call-template name="TR106tf"/>
	</xsl:template>

	<xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="TR106">
		<xsl:call-template name="TR106zzp"/>
	</xsl:template>

	<xsl:template match="zk31:ToegewezenFunctie" mode="TR106">
		<xsl:call-template name="TR106tf"/>
	</xsl:template>

	<xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="TR106">
		<xsl:call-template name="TR106zzp"/>
	</xsl:template>

	<xsl:template match="zk33:ToegewezenFunctie" mode="TR106">
		<xsl:call-template name="TR106tf"/>
	</xsl:template>

	<xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="TR106">
		<xsl:call-template name="TR106zzp"/>
	</xsl:template>

	<xsl:template match="aw39:AanvraagInstelling" mode="TR106">
		<xsl:call-template name="TR106a"/>
	</xsl:template>

	<xsl:template match="zk39:AanvraagInstelling" mode="TR106">
		<xsl:call-template name="TR106a"/>
	</xsl:template>

	<xsl:template name="TR106tf">
		<xsl:param name="pThis" select="."/>
		<xsl:param name="pInstelling" select="./*[local-name() = 'Instelling']"/>
		<xsl:param name="pFunctieCode" select="./*[local-name() = 'FunctieCode']"/>
		<xsl:param name="pSoort" select="./*[local-name() = 'Soort']"/>
		<xsl:param name="pList" select="preceding-sibling::*"/>
		<!-- <xsl:value-of select="$pFunctieCode"/> -->
		<xsl:for-each select="$pList">
			<xsl:variable name="siblingInstelling" select="current()/*[local-name() = 'Instelling']"/>
			<xsl:variable name="siblingFunctieCode" select="current()/*[local-name() = 'FunctieCode']"/>
			<xsl:variable name="siblingSoort" select="current()/*[local-name() = 'Soort']"/>
			
			<xsl:if test="normalize-space($pInstelling) = normalize-space($siblingInstelling) and
						  normalize-space($pFunctieCode) = normalize-space($siblingFunctieCode) and
						  normalize-space($pSoort) = normalize-space($siblingSoort) and
						  true()">
				<xsl:call-template name="checkOverlay">
					<xsl:with-param name="pThis" select="$pThis"/>
					<xsl:with-param name="pOther" select="current()"/>
				</xsl:call-template>
			</xsl:if>

		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="TR106zzp">
		<xsl:param name="pThis" select="."/>
		<xsl:param name="pLeveringsvorm" select="./*[local-name() = 'Leveringsvorm']"/>
		<xsl:param name="pInstelling" select="./*[local-name() = 'Instelling']"/>
		<xsl:param name="pZzpCode" select="./*[local-name() = 'ZzpCode']"/>
		<xsl:param name="pSoort" select="./*[local-name() = 'Soort']"/>
		<xsl:param name="pList" select="preceding-sibling::*"/>
		<!-- <xsl:value-of select="$pFunctieCode"/> -->
		<xsl:for-each select="$pList">
			<xsl:variable name="siblingLeveringsvorm" select="current()/*[local-name() = 'Leveringsvorm']"/>
			<xsl:variable name="siblingInstelling" select="current()/*[local-name() = 'Instelling']"/>
			<xsl:variable name="siblingZzpCode" select="current()/*[local-name() = 'ZzpCode']"/>
			<xsl:variable name="siblingSoort" select="current()/*[local-name() = 'Soort']"/>

			<xsl:if test="normalize-space($pInstelling) = normalize-space($siblingInstelling) and
						  normalize-space($pLeveringsvorm) = normalize-space($siblingLeveringsvorm) and 
						  normalize-space($pZzpCode) = normalize-space($siblingZzpCode) and
						  normalize-space($pSoort) = normalize-space($siblingSoort) and
						  true()">
				<xsl:call-template name="checkOverlay">
					<xsl:with-param name="pThis" select="$pThis"/>
					<xsl:with-param name="pOther" select="current()"/>
				</xsl:call-template>
			</xsl:if>

		</xsl:for-each>
	</xsl:template>

	<xsl:template name="TR106a">
		<xsl:param name="pThis" select="."/>
		<xsl:param name="pLeveringsvorm" select="../../*[local-name() = 'Leveringsvorm']"/>
		<xsl:param name="pInstelling" select="./*[local-name() = 'Instelling']"/>
		<xsl:param name="pZzpCode" select="../../*[local-name() = 'ZzpCode']"/>
		<xsl:param name="pSoort" select="./*[local-name() = 'Soort']"/>
		<xsl:param name="pList" select="preceding-sibling::*[local-name() = 'AanvraagInstelling'] | ../../preceding-sibling::*[local-name() = 'Aanvraag']/*/*[local-name() = 'AanvraagInstelling']"/>
		<!-- <xsl:value-of select="$pFunctieCode"/> -->
		<xsl:for-each select="$pList">
			<xsl:variable name="siblingLeveringsvorm" select="current()/../../*[local-name() = 'Leveringsvorm']"/>
			<xsl:variable name="siblingInstelling" select="current()/*[local-name() = 'Instelling']"/>
			<xsl:variable name="siblingZzpCode" select="current()/../../*[local-name() = 'ZzpCode']"/>
			<xsl:variable name="siblingSoort" select="current()/*[local-name() = 'Soort']"/>

			<xsl:if test="normalize-space($pInstelling) = normalize-space($siblingInstelling) and
						  normalize-space($pLeveringsvorm) = normalize-space($siblingLeveringsvorm) and 
						  normalize-space($pZzpCode) = normalize-space($siblingZzpCode) and
						  normalize-space($pSoort) = normalize-space($siblingSoort) and
						  true()">
				<xsl:call-template name="checkOverlay">
					<xsl:with-param name="pThis" select="$pThis"/>
					<xsl:with-param name="pOther" select="current()"/>
				</xsl:call-template>
			</xsl:if>

		</xsl:for-each>
	</xsl:template>

	<xsl:template name="checkOverlay">
		<xsl:param name="pThis" select="."/>
		<xsl:param name="pOther"/>

		<xsl:variable name="isOverlay">
			<xsl:call-template name="isPeriodOverlay">
				<xsl:with-param name="pThis" select="$pThis"/>
				<xsl:with-param name="pOther" select="$pOther"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:if test="$isOverlay = 'true'">
			<xsl:call-template name="addError">
				<xsl:with-param name="pRule">
					TR106
				</xsl:with-param>
				<xsl:with-param name="pElements" select=" $pThis | $pOther"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>

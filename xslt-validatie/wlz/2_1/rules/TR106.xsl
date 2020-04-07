<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
				xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
	<!-- iwlz 2.1 TR106 version 1.9.20 (2020-04-06) -->

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

	<xsl:template match="zk33:ToegewezenFunctie" mode="TR106">
		<xsl:call-template name="TR106tf"/>
	</xsl:template>

	<xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="TR106">
		<xsl:call-template name="TR106zzp"/>
	</xsl:template>

	<xsl:template name="TR106tf">
		<xsl:param name="pThis" select="."/>
		<xsl:param name="pInstelling" select="./*[local-name() = 'Instelling']"/>
		<xsl:param name="pFunctieCode" select="./*[local-name() = 'FunctieCode']"/>
		<xsl:param name="pList" select="preceding-sibling::*"/>
		<!-- <xsl:value-of select="$pFunctieCode"/> -->
		<xsl:for-each select="$pList">
			<xsl:variable name="siblingInstelling" select="current()/*[local-name() = 'Instelling']"/>
			<xsl:variable name="siblingFunctieCode" select="current()/*[local-name() = 'FunctieCode']"/>
			
			<xsl:if test="normalize-space($pInstelling) = normalize-space($siblingInstelling) and
						  normalize-space($pFunctieCode) = normalize-space($siblingFunctieCode)
						  ">
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
		<xsl:param name="pList" select="preceding-sibling::*"/>
		<!-- <xsl:value-of select="$pFunctieCode"/> -->
		<xsl:for-each select="$pList">
			<xsl:variable name="siblingLeveringsvorm" select="current()/*[local-name() = 'Leveringsvorm']"/>
			<xsl:variable name="siblingInstelling" select="current()/*[local-name() = 'Instelling']"/>
			<xsl:variable name="siblingZzpCode" select="current()/*[local-name() = 'ZzpCode']"/>

			<xsl:if test="normalize-space($pInstelling) = normalize-space($siblingInstelling) and
						  normalize-space($pLeveringsvorm) = normalize-space($siblingLeveringsvorm) and 
						  normalize-space($pZzpCode) = normalize-space($siblingZzpCode)
						  ">
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

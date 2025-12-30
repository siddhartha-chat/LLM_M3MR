* ============================================================.
* SPSS Validation Script (Multi-Agent Batched)
* Generated: 2025-12-30 16:45:52
* Source: R79641.md
* Model: gpt-5-mini
* ============================================================.

* ============================================================.
* Question ID: hidDQ5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hidDQ5": "details"
}
* -----------------------------------------------------------

tit hidDQ5.<br>compute hidDQ5_chk = SUM(hidDQ5_1, hidDQ5_2, hidDQ5_3, hidDQ5_4, hidDQ5_5).<br>temporary.<br>sel if miss(hidDQ5) or hidDQ5<>hidDQ5_chk.<br>list respid, hidDQ5.<br>del var hidDQ5_chk.

* ============================================================.
* Question ID: tested1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "tested1": "details"
}
* -----------------------------------------------------------

tit tested1.<br>temporary.<br>sel if miss(tested1) or tested1<0.<br>list respid, tested1.

* ============================================================.
* Question ID: failed1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "failed1": "details"
}
* -----------------------------------------------------------

tit failed1.<br>temporary.<br>sel if miss(failed1) or failed1<0.<br>list respid, failed1.

* ============================================================.
* Question ID: tested2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "tested2": "details"
}
* -----------------------------------------------------------

tit tested2.<br>temporary.<br>sel if miss(tested2) or tested2<0.<br>list respid, tested2.

* ============================================================.
* Question ID: failed2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "failed2": "details"
}
* -----------------------------------------------------------

tit failed2.<br>temporary.<br>sel if miss(failed2) or failed2<0.<br>list respid, failed2.

* ============================================================.
* Question ID: tested3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "tested3": "details"
}
* -----------------------------------------------------------

tit tested3.<br>temporary.<br>sel if miss(tested3) or tested3<0.<br>list respid, tested3.

* ============================================================.
* Question ID: failed3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "failed3": "details"
}
* -----------------------------------------------------------

tit failed3.<br>temporary.<br>sel if miss(failed3) or failed3<0.<br>list respid, failed3.

* ============================================================.
* Question ID: tested4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "tested4": "details"
}
* -----------------------------------------------------------

tit tested4.<br>temporary.<br>sel if miss(tested4) or tested4<0.<br>list respid, tested4.

* ============================================================.
* Question ID: failed4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "failed4": "details"
}
* -----------------------------------------------------------

tit failed4.<br>temporary.<br>sel if miss(failed4) or failed4<0.<br>list respid, failed4.

* ============================================================.
* Question ID: tested5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "tested5": "details"
}
* -----------------------------------------------------------

tit tested5.<br>temporary.<br>sel if miss(tested5) or tested5<0.<br>list respid, tested5.

* ============================================================.
* Question ID: failed5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "failed5": "details"
}
* -----------------------------------------------------------

tit failed5.<br>
temporary.<br>
* Hidden numeric check: ensure value present and non-negative.<br>
sel if miss(failed5) or ~range(failed5,0,9999999999).<br>
list respid failed5.<br>
del var /** no temp vars created for this check **/.<br>

* ============================================================.
* Question ID: weighted
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "weighted": "details"
}
* -----------------------------------------------------------

tit weighted - per-item and autosum checks.<br>
* Per-item missing/range validation for the 10 weighted numeric items.<br>
DO REPEAT w = weighted_1 TO weighted_10.<br>
  temporary.<br>
  sel if miss(w) or ~range(w,0,9999999999).<br>
  list respid w.<br>
* Compute a calculated total from the item list and compare to totweight (respect QOF override).<br>
compute calc_totweight = SUM(weighted_1 TO weighted_10).<br>
compute tot_mismatch_flag = 0.<br>
if (QOF = 0 and (miss(totweight) or (calc_totweight <> totweight))) tot_mismatch_flag = 1.<br>
temporary.<br>
sel if tot_mismatch_flag = 1.<br>
list respid weighted_1 TO weighted_10 calc_totweight totweight QOF.<br>
del var tot_mismatch_flag calc_totweight.<br>

* ============================================================.
* Question ID: totweight
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "totweight": "details"
}
* -----------------------------------------------------------

tit totweight - validate presence, range and match to weighted sum.<br>
* Recalculate total from weighted items and compare to totweight (respect QOF override).<br>
compute calc_totweight = SUM(weighted_1 TO weighted_10).<br>
temporary.<br>
sel if miss(totweight) or ~range(totweight,0,9999999999) or (QOF = 0 and calc_totweight <> totweight).<br>
list respid totweight calc_totweight QOF weighted_1 TO weighted_10.<br>
del var calc_totweight.<br>

* ============================================================.
* Question ID: checksum
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "checksum": "details"
}
* -----------------------------------------------------------

tit checksum - check equals totweight / 10 (rounded) and presence.<br>
* Compute expected checksum from totweight.<br>
compute checksum_chk = totweight / 10.\nexe.<br>
temporary.<br>
* Validate presence/range and that checksum matches computed value (allow rounding; respect QOF override).<br>
sel if miss(checksum) or ~range(checksum,0,9999999999) or (QOF = 0 and (ROUND(checksum,2) <> ROUND(checksum_chk,2))).<br>
list respid totweight checksum checksum_chk QOF.<br>
del var checksum_chk.<br>

* ============================================================.
* Question ID: QOF
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "QOF": "details"
}
* -----------------------------------------------------------

tit QOF - override flag validation.<br>
temporary.<br>
* QOF should be 0 or 1; ensure not missing and within allowed codes.<br>
sel if miss(QOF) or ~any(QOF,0,1).<br>
list respid QOF.<br>

* ============================================================.
* Question ID: hQLOI
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hQLOI": "details"
}
* -----------------------------------------------------------

tit hQLOI - hidden per-question LOI storage flag presence check.<br>
temporary.<br>
* Presence check for hidden LOI per-question string/flag. List if missing.<br>
sel if miss(hQLOI) .<br>
list respid hQLOI.<br>

* ============================================================.
* Question ID: respLOI
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "respLOI": "details"
}
* -----------------------------------------------------------

tit respLOI - validate screener/main/total LOI numeric fields.<br>
* Per-subquestion numeric LOI checks (should be numeric, non-negative).<br>
DO REPEAT r = respLOI_1 respLOI_2 respLOI_3.<br>
  temporary.<br>
  sel if miss(r) or ~range(r,0,9999999999).<br>
  list respid r.<br>
* Extra check: total (respLOI_3) should be >= screener (respLOI_1) and main part (respLOI_2) should be non-negative and <= total.<br>
temporary.<br>
sel if ( (not miss(respLOI_3) and not miss(respLOI_1) and respLOI_3 < respLOI_1) or (not miss(respLOI_3) and not miss(respLOI_2) and respLOI_2 < 0 ) or (not miss(respLOI_3) and not miss(respLOI_2) and respLOI_2 > respLOI_3) ).<br>
list respid respLOI_1 respLOI_2 respLOI_3.<br>

* ============================================================.
* Question ID: surveyLOI
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "surveyLOI": "details"
}
* -----------------------------------------------------------

tit surveyLOI - computed minutes LOI vs respLOI_3 (seconds).<br>
* Compute expected surveyLOI from respLOI_3 (seconds -> minutes).<br>
compute surveyLOI_chk = respLOI_3 / 60.\nexe.<br>
temporary.<br>
* Validate presence/range and match to computed value (allow rounding). Do not flag if hLOIupdated indicates server-side update already applied (hLOIupdated=1).<br>
sel if miss(surveyLOI) or ~range(surveyLOI,0,9999999999) or (hLOIupdated <> 1 and (ROUND(surveyLOI,2) <> ROUND(surveyLOI_chk,2))).<br>
list respid respLOI_3 surveyLOI surveyLOI_chk hLOIupdated.<br>
del var surveyLOI_chk.<br>

* ============================================================.
* Question ID: hLOIupdated
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hLOIupdated": "details"
}
* -----------------------------------------------------------

tit hLOIupdated - hidden flag indicating LOI update applied.<br>
temporary.<br>
* Expect 0/1 flag; some surveys may only store 1 when updated, but accept both 0 and 1. Flag missing or invalid codes.<br>
sel if miss(hLOIupdated) or ~any(hLOIupdated,0,1).<br>
list respid hLOIupdated.<br>

* ============================================================.
* Question ID: RespondentLOI
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "RespondentLOI": "details"
}
* -----------------------------------------------------------

tit RespondentLOI - traditional LOI minutes presence and range check.<br>
temporary.<br>
sel if miss(RespondentLOI) or ~range(RespondentLOI,0,9999999999).<br>
list respid RespondentLOI respLOI_3 surveyLOI.<br>

* ============================================================.
* Question ID: qTimeStamp
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "qTimeStamp": "details"
}
* -----------------------------------------------------------

tit qTimeStamp.<br>do repeat v = qTimeStamp_start qTimeStamp_screener qTimeStamp_sec1 qTimeStamp_sec2 qTimeStamp_sec3 qTimeStamp_Sec4 qTimeStamp_main qTimeStamp_surveyLOI.<br>temporary.<br>sel if v = "".<br>list respid, v.<br>end repeat.

* ============================================================.
* Question ID: qIntLen
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "qIntLen": "details"
}
* -----------------------------------------------------------

tit qIntLen.<br>do repeat v = qIntLen_start qIntLen_screener qIntLen_sec1 qIntLen_sec2 qIntLen_sec3 qIntLen_Sec4 qIntLen_main qIntLen_surveyLOI.<br>temporary.<br>sel if miss(v) or v < 0 or v > 9999999999.<br>list respid, v.<br>end repeat.

* ============================================================.
* Question ID: hidTimeOutMin
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hidTimeOutMin": "details"
}
* -----------------------------------------------------------

tit hidTimeOutMin.<br>temporary.<br>sel if miss(hidTimeOutMin_1) or hidTimeOutMin_1 < 0 or hidTimeOutMin_1 > 99.<br>list respid, hidTimeOutMin_1.<br>temporary.<br>sel if miss(hidTimeOutMin_2) or hidTimeOutMin_2 < 0 or hidTimeOutMin_2 > 99.<br>list respid, hidTimeOutMin_2.

* ============================================================.
* Question ID: hSType
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hSType": "details"
}
* -----------------------------------------------------------

tit hSType.<br>temporary.<br>sel if miss(hSType) or ~range(hSType,1,2).<br>list respid, hSType.

* ============================================================.
* Question ID: hidSessionsCount
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hidSessionsCount": "details"
}
* -----------------------------------------------------------

tit hidSessionsCount.<br>temporary.<br>sel if miss(hidSessionsCount) or hidSessionsCount < 0 or hidSessionsCount > 999.<br>list respid, hidSessionsCount.

* ============================================================.
* Question ID: id
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "id": "details"
}
* -----------------------------------------------------------

tit id.<br>* Background variable (used in sample upload) - no validation required.

* ============================================================.
* Question ID: SurveyID
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "SurveyID": "details"
}
* -----------------------------------------------------------

tit SurveyID.<br>* Hidden variable that stores survey R number - no validation required.

* ============================================================.
* Question ID: prepwd
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "prepwd": "details"
}
* -----------------------------------------------------------

tit prepwd.<br>* Hidden pretest password variable - no validation required.

* ============================================================.
* Question ID: QRedirect
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "QRedirect": "details"
}
* -----------------------------------------------------------

tit QRedirect.<br>* Hidden variable that stores redirect URL - no validation required.

* ============================================================.
* Question ID: qSupport
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "qSupport": "details"
}
* -----------------------------------------------------------

tit qSupport.<br>temporary.<br>sel if miss(qSupport) or ~any(qSupport,0,1).<br>list respid, qSupport.

* ============================================================.
* Question ID: hScrAnswered
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hScrAnswered": "details"
}
* -----------------------------------------------------------

tit hScrAnswered.<br>* This is a derived variable (Hidden & Disabled) - no validation needed.<br>

* ============================================================.
* Question ID: hScrCount
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hScrCount": "details"
}
* -----------------------------------------------------------

tit hScrCount.<br>* This is a derived variable (Hidden, Numeric & Disabled) - no validation needed.<br>

* ============================================================.
* Question ID: qHardQuota
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "qHardQuota": "details"
}
* -----------------------------------------------------------

tit qHardQuota.<br>DO REPEAT v=qHardQuota_quotaPretest qHardQuota_OVERQUOTA_quota1 qHardQuota_OVERQUOTA_quota3 qHardQuota_OVERQUOTA_quota5 qHardQuota_OVERQUOTA_quota6 qHardQuota_OVERQUOTA_qhidS10 qHardQuota_OVERQUOTA_qqCountry qHardQuota_OVERQUOTA_qS5 qHardQuota_OVERQUOTA_qS5x2 qHardQuota_OVERQUOTA_qS5Final.<br>temporary.<br>sel if miss(v).<br>list respid, v.<br>END REPEAT.

* ============================================================.
* Question ID: hElapse
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hElapse": "details"
}
* -----------------------------------------------------------

tit hElapse.<br>temporary.<br>sel if miss(hElapse_1) or miss(hElapse_2).<br>list respid, hElapse_1, hElapse_2.

* ============================================================.
* Question ID: hSLFlags
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hSLFlags": "details"
}
* -----------------------------------------------------------

tit hSLFlags.<br>* This is a derived variable (Hidden & Disabled) - no validation needed.<br>

* ============================================================.
* Question ID: hCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hCountry": "details"
}
* -----------------------------------------------------------

tit hCountry.<br>temporary.<br>sel if miss(hCountry) or ~range(hCountry,1033,1033).<br>list respid, hCountry.

* ============================================================.
* Question ID: qErrNum
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "qErrNum": "details"
}
* -----------------------------------------------------------

tit qErrNum.<br>DO REPEAT v=qErrNum_1 qErrNum_2 qErrNum_3.<br>temporary.<br>sel if miss(v).<br>list respid, v.<br>END REPEAT.

* ============================================================.
* Question ID: hRawLink
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hRawLink": "details"
}
* -----------------------------------------------------------

tit hRawLink.<br>temporary.<br>sel if hRawLink<>"" .<br>list respid, hRawLink.

* ============================================================.
* Question ID: hULink
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hULink": "details"
}
* -----------------------------------------------------------

tit hULink.<br>temporary.<br>sel if hULink<>"" .<br>list respid, hULink.

* ============================================================.
* Question ID: hCurrQid
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hCurrQid": "details"
}
* -----------------------------------------------------------

tit hCurrQid.<br>* This is a derived variable (Hidden & Disabled) - no validation needed.<br>

* ============================================================.
* Question ID: hPrevQid
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hPrevQid": "details"
}
* -----------------------------------------------------------

tit hPrevQid.<br>* This is a hidden/derived variable (Disabled='true') used to store previous question seen by respondent.<br>* No SPSS validation is required for derived/hidden variables.<br>.

* ============================================================.
* Question ID: hAllQids
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hAllQids": "details"
}
* -----------------------------------------------------------

tit hAllQids.<br>* This is a hidden/derived variable (Disabled='true') used to store all question IDs seen by respondent.<br>* No SPSS validation is required for derived/hidden variables.<br>.

* ============================================================.
* Question ID: showJumpLinks
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "showJumpLinks": "details"
}
* -----------------------------------------------------------

tit showJumpLinks.<br>* This is a hidden/derived variable (Disabled='true') used to control jump links display.<br>* No SPSS validation is required for derived/hidden variables.<br>.

* ============================================================.
* Question ID: interviewStartUTC
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "interviewStartUTC": "details"
}
* -----------------------------------------------------------

tit interviewStartUTC.<br>temporary.<br>sel if miss(interviewStartUTC).<br>list respid, interviewStartUTC.

* ============================================================.
* Question ID: interviewEndUTC
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "interviewEndUTC": "details"
}
* -----------------------------------------------------------

tit interviewEndUTC.<br>temporary.<br>sel if miss(interviewEndUTC).<br>list respid, interviewEndUTC.

* ============================================================.
* Question ID: interviewStartAEST
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "interviewStartAEST": "details"
}
* -----------------------------------------------------------

tit interviewStartAEST.<br>temporary.<br>sel if miss(interviewStartAEST).<br>list respid, interviewStartAEST.

* ============================================================.
* Question ID: interviewEndAEST
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "interviewEndAEST": "details"
}
* -----------------------------------------------------------

tit interviewEndAEST.<br>temporary.<br>sel if miss(interviewEndAEST).<br>list respid, interviewEndAEST.

* ============================================================.
* Question ID: IQSvars
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "IQSvars": "details"
}
* -----------------------------------------------------------

tit IQSvars.<br>* This question contains multiple hidden sub-variables and is Disabled='true' (derived/storage for Imperium usage).<br>* No SPSS validation is required for derived/hidden variables.<br>.

* ============================================================.
* Question ID: IQSenable
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "IQSenable": "details"
}
* -----------------------------------------------------------

tit IQSenable.<br>temporary.<br>sel if miss(IQSenable) or ~range(IQSenable,1,1).<br>list respid, IQSenable.

* ============================================================.
* Question ID: hRecordeOn
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "hRecordeOn": "details"
}
* -----------------------------------------------------------

tit hRecordeOn.<br>temporary.<br>sel if miss(hRecordeOn).<br>list respid, hRecordeOn.


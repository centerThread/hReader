rootContext = 'http://127.0.0.1:3000'
patientId = 0

measures = 
  "8A4D92B2-397A-48D2-0139-C626C0935307":
    nqfId: "0068"
    title: "Ischemic Vascular Disease (IVD): Use of Aspirin or Another Antithrombotic"
    description: "Percentage of patients 18 years of age and older who were discharged alive for acute myocardial infarction (AMI), coronary artery bypass graft (CABG) or percutaneous coronary interventions (PCI) in the 12 months prior to the measurement period, or who had an active diagnosis of ischemic vascular disease (IVD) during the measurement period, and who had documentation of use of aspirin or another antithrombotic during the measurement period."
    status: "pass"
    recommendation: "The USPSTF strongly recommends that clinicians discuss aspirin chemoprevention with adults who are at increased risk (5-year risk of greater than or equal to 3 percent) for coronary heart disease (CHD). Discussions with patients should address both the potential benefits and harms of aspirin therapy. ('A' recommendation) The USPSTF recommends the use of aspirin for men age 45 to 79 years when the potential benefit due to a reduction in myocardial infarctions outweighs the potential harm due to an increase in gastrointestinal hemorrhage ('A' recommendation). The USPSTF recommends the use of aspirin for women age 55 to 79 years when the potential benefit of a reduction in ischemic stroke outweighs the potential harm of an increase in gastrointestinal hemorrhage. ('A' recommendation)"
  "8A4D92B2-3946-CDAE-0139-78E0235B7B8B":
    nqfId: "0070"
    title: "Coronary Artery Disease (CAD): Beta-Blocker Therapy—Prior Myocardial Infarction (MI) or Left Ventricular Systolic Dysfunction (LVEF <40%) "
    description: "Percentage of patients aged 18 years and older with a diagnosis of coronary artery disease seen within a 12 month period who also have a prior MI or a current or prior LVEF <40% who were prescribed beta-blocker therapy"
    status: "fail"
    recommendation: "It is beneficial to start and continue beta-blocker therapy indefinitely in all patients who have had MI, acute coronary syndrome, or left ventricular dysfunction with or without heart failure symptoms, unless contraindicated (Class I Recommendation, Level A Evidence). (ACC/AHA, 2007)"
  "8A4D92B2-3676-1350-0136-9768076550F0":
    nqfId: "0083"
    title: "Heart Failure (HF): Beta-Blocker Therapy for Left Ventricular Systolic Dysfunction (LVSD)"
    description: "Percentage of patients aged 18 years and older with a diagnosis of heart failure (HF) with a current or prior left ventricular ejection fraction (LVEF) < 40% who were prescribed beta-blocker therapy either within a 12 month period when seen in the outpatient setting OR at each hospital discharge"
    status: "fail"
    recommendation: "Treatment with a beta blocker should be initiated at very low doses [see excerpt from guideline table below], followed by gradual increments in dose if lower doses have been well tolerated… physicians, especially cardiologists and primary care physicians, should make every effort to achieve the target doses of the beta blockers shown to be effective in major clinical trials. (ACCF/AHA, 2009)"
  "8A4D92B2-3946-CDAE-0139-78E4E5077D41":
    nqfId: "0081"
    title: "Heart Failure (HF): Angiotensin-Converting Enzyme (ACE) Inhibitor or Angiotensin Receptor Blocker (ARB) Therapy for Left Ventricular Systolic Dysfunction (LVSD) "
    description: "Percentage of patients aged 18 years and older with a diagnosis of heart failure (HF) with a current or prior left ventricular ejection fraction (LVEF) < 40% who were prescribed ACE inhibitor or ARB therapy either within a 12 month period when seen in the outpatient setting OR at each hospital discharge"
    status: "pass"
    recommendation: "Treatment with an [ACE inhibitor] should be initiated at low doses [see excerpt from guideline table below], followed by gradual increments in dose if lower doses have been well tolerated… Clinicians should attempt to use doses that have been shown to reduce the risk of cardiovascular events in clinical trials. If these target doses of an [ACEinhibitor] cannot be used or are poorly tolerated, intermediate doses should be used with the expectation that there are likely to be only small differences in efficacy between low and high doses. (ACCF/AHA, 2009)"
  "8A4D92B2-397A-48D2-0139-7CCB48F6025D":
    nqfId: "0056"
    title: "Diabetes: Foot Exam"
    description: "Percentage of patients aged 18-75 years of age with diabetes who had a foot exam during the measurement period."
    status: "fail"
    recommendation: "American Diabetes Association (2009) Guidelines/ Recommendations:  Perform annual comprehensive foot examination to identify risk factors predictive of ulcers and amputations. The foot examination should include inspection, assessment of foot pulses, and testing for loss of protective sensation (10-g monofilament plus testing any one of: vibration using 128-Hz tuning fork, pinprick sensation, ankle reflexes, or vibration perception threshold)."
  "8A4D92B2-397A-48D2-0139-9CD4937E6C86":
    nqfId: "0059"
    title: "Diabetes: Hemoglobin A1c Poor Control"
    description: "Percentage of patients 18-75 years of age with diabetes who had hemoglobin A1c > 9.0% during the measurement period."
    status: "fail"
    recommendation: "In type 1 and type 2 diabetes, randomized controlled trials of intensive versus standard glycemic control have not shown a significant reduction in CVD outcomes during the randomized portion of the trials. Long-term follow-up of the Diabetes Control and Complications Trial (DCCT) and UK Prospective Diabetes Study (UKPDS) cohorts suggests that treatment to A1C targets below or around 7% in the years soon after the diagnosis of diabetes is associated with long-term reduction in risk of macrovascular disease. Until more evidence becomes available, the general goal of <7% appears reasonable for many adults for macrovascular risk reduction. (Level of Evidence: B)"
  "8A4D92B2-39CA-AF4B-0139-D472724E0C46":
    nqfId: "0055"
    title: "Diabetes: Eye Exam"
    description: "Percentage of patients 18-75 years of age with diabetes who had a retinal or dilated eye exam by an eye care professional during the measurement period or a negative retinal exam (no evidence of retinopathy) in the 12 months prior to the measurement period"
    status: "pass"
    recommendation: "Adults and children aged 10 years or older with type 1 diabetes should have an initial dilated and comprehensive eye examination by an ophthalmologist or optometrist within 5 years after the onset of diabetes. (B recommendation)"
  "8A4D92B2-3946-CDAE-0139-77E3674A60FC":
    nqfId: "0088"
    title: "Diabetic Retinopathy: Documentation of Presence or Absence of Macular Edema and Level of Severity of Retinopathy"
    description: "Percentage of patients aged 18 years and older with a diagnosis of diabetic retinopathy who had a dilated macular or fundus exam performed which included documentation of the level of severity of retinopathy and the presence or absence of macular edema during one or more office visits within 12 months"
    status: "pass"
    recommendation: "Since treatment is effective in reducing the risk of visual loss, detailed examination is indicated to assess for the following features that often lead to visual impairment: presence of macular edema, optic nerve neovascularization and/or neovascularization elsewhere, signs of severe NPDR and vitreous or preretinal hemorrhage (Level A:III Recommendation) (AAO, 2003)."
  "8A4D92B2-397A-48D2-0139-7E243C8B15B6":
    nqfId: "0062"
    title: "Diabetes: Urine Protein Screening"
    description: "The percentage of patients 18-75 years of age with diabetes who had a nephropathy screening test or evidence of nephropathy during the measurement period."
    status: "fail"
    recommendation: "California Healthcare Foundation/American Geriatrics Society (2003): A test for the presence of microalbumin should be performed at diagnosis in patients with type 2 diabetes mellitus. After the initial screening and in the absence of previously demonstrated macro- or microalbuminuria, a test for the presence of microalbumin should be performed annually. (Level III, Grade A)"
  "8A4D92B2-356D-A09E-0135-AF80862E655B":
    nqfId: "FSAHip"
    title: "Functional Status Assessment for Hip Replacement"
    description: "Percentage of patients aged 18 years and older with primary total hip arthroplasty (THA) who completed baseline and follow-up (patient-reported) functional status assessments"
    status: "pass"
    recommendation: "Clinicians should ask patients to report on functional status during at least two points in time while undergoing treatment: before surgery and after a period of post-sugical recovery."
  "8A4D92B2-356D-A09E-0135-9B065EFA5D47":
    nqfId: "FSAKnee"
    title: "Functional Status Assessment for Knee Replacement"
    description: "Percentage of patients aged 18 years and older with primary total knee arthroplasty (TKA) who completed  baseline and follow-up (patient-reported) functional status assessments."
    status: "fail"
    recommendation: "Clinicians should ask patients to report on functional status during at least two points in time while undergoing treatment: before surgery and after a period of post-sugical recovery."
  "8A4D92B2-397A-48D2-0139-9CEA5D84733A":
    nqfId: "0385"
    title: "Colon Cancer: Chemotherapy for AJCC Stage III Colon Cancer Patients"
    description: "Percentage of patients aged 18 through 80 years with AJCC Stage III colon cancer who are referred for adjuvant chemotherapy, prescribed adjuvant chemotherapy, or have previously received adjuvant chemotherapy within the 12-month reporting period."
    status: "pass"
    recommendation: "For stage III patients (T1-4, N1-2, M0), the panel recommends 6 months of adjuvant chemotherapy following primary surgical treatment. The treatment options are: 5-FU/LV/oxaliplatin (mFOLFOX6) as the standard of care (category 1); bolus 5-FU/LV/oxaliplatin (FLOX, category 1); capecitabine/oxaliplatin (CapeOx); or single agent capecitabine (category 2A) or 5-FU/LV (category 2A) in patients felt to be inappropriate for oxaliplatin therapy (NCCN, 2012). "
  "8A4D92B2-397A-48D2-0139-B0A6A11F2DA5":
    nqfId: "0387"
    title: "Breast Cancer: Hormonal Therapy for Stage IC-IIIC Estrogen Receptor/Progesterone Receptor (ER/PR) Positive Breast Cancer"
    description: "Percentage of female patients aged 18 years and older with Stage IC through IIIC, ER or PR positive breast cancer who were prescribed tamoxifen or aromatase inhibitor (AI) during the 12-month reporting period"
    status: "pass"
    recommendation: "Adjuvant therapy for postmenopausal women with hormone receptor–positive breast cancer should include an aromatase inhibitor in order to lower the risk of tumor recurrence. Aromatase inhibitors are appropriate as initial treatment for women with contraindications to tamoxifen. For all other postmenopausal women, treatment options include 5 years of aromatase inhibitors treatment or sequential therapy consisting of tamoxifen (for either 2 to 3 years or 5 years) followed by aromatase inhibitors for 2 to 3, or 5 years (ASCO guidelines include narrative rankings) (ASCO). "
  "8A4D92B2-397A-48D2-0139-B0A4BCA22CF1":
    nqfId: "0389"
    title: "Prostate Cancer: Avoidance of Overuse of Bone Scan for Staging Low Risk Prostate Cancer Patients"
    description: "Percentage of patients, regardless of age, with a diagnosis of prostate cancer at low risk of recurrence receiving interstitial prostate brachytherapy, OR external beam radiotherapy to the prostate, OR radical prostatectomy, OR cryotherapy who did not have a bone scan performed at any time since diagnosis of prostate cancer"
    status: "pass"
    recommendation: "A bone scan is appropriate for T1 to T2 disease in the presence of a PSA greater than 20 ng/mL, Gleason score of 8 or higher, clinical stage of T3 to T4, or symptomatic disease."

@PopHealth = {
  constructor: (@measures) ->
    @measures ||= {}

  getPatient: ->
    $.ajax(
      type: "GET",
      url: "http://hreader.local/pophealth.json",
      success: (data) ->
        alert(JSON.stringify(data))
      error: (jqXHR, textStatus, errorThrown) ->
        alert(JSON.stringify(errorThrown))
    )

  getAvailableMeasures: ->
    $.ajax(
      type: "GET",
      url: "#{rootContext}/measures/available",
      isModified: false,
      dataType: "jsonp",
      #timeout: 5000,
      success: (measures) ->
        PopHealth.pollMeasures(measures)
      error: (jqXHR, textStatus, errorThrown) ->
        PopHealth.showUnreachable()
    )

  pollMeasures: (measures) ->
    for measure in measures
      PopHealth.pollMeasure(measure)

  pollMeasure: (measure, uuid) ->
    # id, sub_id, category, name, description, ipp, denom, numer, denomexcep, 
    url = "#{rootContext}/measures/patient_result/#{patientId}/#{measure['id']}/"
    url += "#{measure['sub_id']}" if measure["sub_id"]?
    url += "?uuid=#{uuid}" if uuid

    $.ajax(
      type: "GET",
      url: url,
      dataType: "jsonp",
      #timeout: 5000,
      success: (data) ->
        if data['completed'] then PopHealth.updateMeasure(data) else PopHealth.pollMeasure(measure, data["uuid"])
      error: (data) ->
        PopHealth.showError(data)
    )

  updateMeasure: (measure) ->
    

  showError: (measure) ->
    alert("There was an error retrieving measure")

  showResult: (measure) ->
    $("#more-info").hide()
    
    data = measures[$(measure).attr("id")]
    $("#mi-title").html(data["title"])
    $("#mi-description").html(data["description"])
    $("#mi-status").html(data["status"])
    $("#mi-recommendation").html(data["recommendation"])
    
    $("#more-info").slideDown()
    $("#more-info").find(".paramItem").scrollTop(0)

  showUnreachable: (data) ->
    # Show that we cannot connect to the quality measure service
    alert("Service is unreachable")

  filterResults: (criteria) ->
    results = $(".category ul li." + criteria)
    results.slideToggle()
    results.toggleClass('result-filter')

  filterCategory: (categoryHeader) ->
    measures = $(categoryHeader).parent(".category").find("li")
    measures.slideToggle()
    measures.toggleClass('category-filter')
}

$(document).ready ->
  $(".category ul li").on "mouseup", (event) ->
    PopHealth.showResult(event.target)
  $(".category h3").on "mouseup", (event) ->
    PopHealth.filterCategory(event.target)
  $(".pophealth-result-container").on "mouseup", (event) ->
    PopHealth.filterResults(event.target.getAttribute("data-filter-criteria"))

  #PopHealth.getAvailableMeasures()
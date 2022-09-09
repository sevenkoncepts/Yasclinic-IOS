//
//  apiManager.swift
//  VRD
//
//  Created by Mac Book Pro on 21/09/2021.
//

import Foundation
import Alamofire
//import KRProgressHUD
var otpGenrated = ""
var organizerID = "dumy"

let arabicLanguage = "ar-AE"
let englishLanguage = "en"

var selectedLanguage = ""
var selectedPartnerId = ""

enum Router: URLRequestConvertible {
    
    //YAS Clinic
    
    case login([String: String])
    case forgotPassword([String:String])
    case getSpecialities([String: String])
    case aboutUs([String:String])
    case getInsuranceNetwork([String: String])
    case getAboutCovid([String:String])
    case getHospitals([String:String])
    case registration([String:String])
    case contactUs([String:String])
    case getOurPartners([String:String])
    case getSchedule([String:String])
    case getdoctorBookings([String:String])
    case getUpcomingBookings([String:String])
    case getRecentBookings([String:String])
    case getNotifications([String:String])
    case getNotificationsCount([String:String])
    case getDeviceIDs([String:String])
    case getSpecificInsurancePartener([String:String])
    case getDoctors([String:String])
    //
    case organizers([String:String])
    case showByShortName([String:String])
//    case login([String: String])
    case hallsCompaniesList([String:String])
    case UpdateProfile([String:Any])
    case testfunc([String: String])
    case SendOtp([String:String])
    case getprofile([String : String])
    case CompanyDetils([String:String])
    case checkOtp([String:String])
    case PasswordReset([String:String])
    case FairSpeakersList([String:String])
    case FairCompaniesList([String:String])
    case FairJobsList([String:Any])
    case Faqs([String:String])
    case ConferenceAgenda([String:String])
    case About([String:String])
    case getCarrerTest([String:String])
    case saveCarrerTest([String:Any])
    case MatchingRecruiter([String:String])
    case MatchingJobs([String:Any])
    case ApplyJob([String:String])
    case MatchingWebinars([String:String])
    case MatchingCompanies([String:String])
    case CompanyDerails([String:String])
    case GoodieBags([String:String])
    case FairHalls([String:String])
    case CompnyGoodieBags([String:String])
    case AddGoodie([String:String])
    case removeGoodie([String:String])
    case SpeakerDetails([String:String])
    case WebinarDetails([String:String])
    case recuiterDetails([String:String])
    case AvailableSlots([String:String])
    case SlotsOfDate([String:String])
    case RequestInterview([String:String])
    case Schedules([String:String])
    case CancelInterView([String:String])
    case ResendEmail([String:String])
    case CompanyJobs([String:Any])
    case RecrutireCompanies([String:String])
    case FairMedia([String:String])
    case Receptionists([String:String])
    case jobDetails([String:String])
    case PollServay([String:String])
    case fairSurvey([String:String])
    case SaveSurvay([String:Any])
    case saveFairSurvey([String:Any])
    case GetExitSurvey([String:String])
    case MatchCheck([String:String])
    case Accept([String:String])
    case privacyPolicy([String:String])
    case extraFields([String:String])
     
//"https://beta-api-umair.virtualrecruitmentdays.com/"
//    "https://staging-api.virtualrecruitmentdays.com/api/"
    var baseURL: URL {
        return URL(string: URLS.baseUrl )!
    }

    var method: HTTPMethod {
        switch self {
        case .forgotPassword,.organizers,.showByShortName,.registration,.login,.UpdateProfile,.SendOtp,.PasswordReset,.FairJobsList,.saveCarrerTest,.ConferenceAgenda,.MatchingJobs,.MatchingRecruiter,.ApplyJob,.MatchingWebinars,.MatchingCompanies,.CompanyDerails,.GoodieBags,.CompnyGoodieBags,.removeGoodie,.FairSpeakersList,.AvailableSlots,.SlotsOfDate,.RequestInterview,.Schedules,.CancelInterView,.getCarrerTest,.RecrutireCompanies,.CompanyJobs,.PollServay,.SaveSurvay,.GetExitSurvey,.fairSurvey,.saveFairSurvey,.MatchCheck,.AddGoodie,.extraFields,.CompanyDetils:
            return .post
        case .testfunc:
            return .post
        case .getDoctors,.getSpecificInsurancePartener,.getDeviceIDs,.getNotificationsCount,.getNotifications,.getRecentBookings,.getUpcomingBookings,.getdoctorBookings,.getSchedule,.getOurPartners,.contactUs,.aboutUs,.getHospitals,.getAboutCovid,.getInsuranceNetwork,.getSpecialities,.getprofile,.FairCompaniesList,.Faqs,.About,.checkOtp,.SpeakerDetails,.WebinarDetails,.recuiterDetails,.ResendEmail,.hallsCompaniesList,.FairMedia,.Receptionists,.jobDetails,.Accept,.FairHalls,.privacyPolicy:
            return .get
        }
    }
    

    var path: String {
        switch self {
            //YAS Clinic
        case .login:
            return "auth/local"
        case .forgotPassword:
            return "auth/forgot-password"
        case .getSpecialities:
            return "specialties"
        case .aboutUs:
            return "about-ya"
        case .getInsuranceNetwork:
            return "insurance-network"
        case .getAboutCovid:
            return "about-covid"
        case .getHospitals:
            return "hospitals"
        case .registration:
            return "auth/local/register"
        case .contactUs:
            return "contactus-forms"
        case .getOurPartners:
            return "insurance-partners"
        case .getSchedule:
            return "doctor-schedules"
        case .getdoctorBookings:
            return "bookings"
        case .getUpcomingBookings:
            return "bookings"
        case .getRecentBookings:
            return "bookings"
        case .getNotifications:
            return "user-push-notifications"
        case .getNotificationsCount:
            return "user-push-notifications"
        case .getDeviceIDs:
            return"user-devices"
        case .getSpecificInsurancePartener:
            return "insurance-partners/\(selectedPartnerId)"
        case .getDoctors:
            return "doctors"
            
            
        //
        case .organizers:
            return "api/organizerfairs"
        case .showByShortName:
            return "api/auth/fair/show-by-shortname"
        
        case .UpdateProfile:
            return "api/save/candidate/profile"
        case .SendOtp:
            return "api/password/create"
        case .testfunc:
            return "api/users"
        case .getprofile:
            return "api/getprofile"
        case .checkOtp:
            return "api/password/find/\(otpGenrated)"
        case .PasswordReset:
            return "api/password/reset"
        case .ConferenceAgenda:
            return "api/auth/fair/webinars"
        case .FairSpeakersList:
            return "api/auth/fair/speakers"
        case .FairCompaniesList:
            return URLS.fairCompaniesList
        case .FairJobsList:
            return "api/auth/fair/jobs/"
        case .Faqs:
            return URLS.Faqs
        case .About:
            return ("api/auth/about/fair/\(organizerID)")
        case .getCarrerTest:
            return "api/fair/career/test/show"
//            fair/career/test/show/
        case .saveCarrerTest:
            return "api/save/candidate/career-test"
        case .MatchingJobs:
            return URLS.getJobs//"api/candidate/jobs"
        case .MatchingRecruiter:
            return "api/candidate/recruiters"
        case .ApplyJob:
            return "api/candidate/apply/job"
        case .MatchingWebinars:
            return "api/candidate/webinars"
        case .MatchingCompanies:
            return "api/candidate/companies"
        case .CompanyDerails:
            return "api/company/detail"
        case .GoodieBags:
            return "api/goodies/list"
        case .CompnyGoodieBags:
            return "api/goodiebag/companylist"
        case .removeGoodie:
            return "api/goodiebag/companylist"
        case .WebinarDetails:
            return "api/auth/fair/webinars/detail/\(organizerID)/\(URLS.webinarDetails)"
        case .SpeakerDetails:
            return "api/auth/get/speaker/detail/\(URLS.speakerDetails)"
        case .recuiterDetails:
            return URLS.recuiterdetails
        case .AvailableSlots:
            return "api/recruiter/available/slot/dates"
        case .SlotsOfDate:
            return "api/recruiter/available/slots"
        case .RequestInterview:
            return "api/company/recruiters/scheduling/invite"
        case .Schedules:
            return "api/company/recruiters/interview/invitations"
        case .CancelInterView:
            return "api/candidate/cancel/interview"
        case .ResendEmail:
            return "api/resend/confirmation/email/\(URLS.ResendEmail)"
        case .hallsCompaniesList:
            return "api/companies/list/\(URLS.hallsCompaniesList)"
        case .CompanyJobs:
            return "api/candidate/company/jobs"
        case .RecrutireCompanies:
            return "api/candidate/company/recruiters"
        case.FairMedia:
            return "api/fair/media/list/\(organizerID)"
        case .Receptionists:
            return "api/fair/receptionists/\(organizerID)"
        case .jobDetails:
            return "api/front/job/detail/\(URLS.jobDertails)"
        case .PollServay :
            return "api/auth/company/poll"
        case .fairSurvey:
            return "api/auth/fair/survey"
        case .SaveSurvay:
            return "api/auth/save/poll"
        case .GetExitSurvey:
            return  "api/auth/save/survey"
        case .saveFairSurvey:
            return "api/auth/save/survey"
        case.MatchCheck:
            return "api/auth/matching/detail"
        case .Accept:
            return "api/interview/book/schedule/\(URLS.accept)/candidate"
        case .FairHalls:
            return "api/fair/halls/list/\(organizerID)"
        case .CompanyDetils:
            return "api/front/exibitor/detail"
            
        case .AddGoodie:
            return "api/addgoodiecandidate"
        case .privacyPolicy:
//            return "api/auth/fair/privacy/\(organizerID)"
            return URLS.showTermsOrPricvacy//"api/auth/fair/terms/\(organizerID)"
        case .extraFields:
            return "api/auth/fair/fairextrafields"
            
        }
        
    }

    func asURLRequest() throws -> URLRequest {
        print(path)
        let urlString = baseURL.appendingPathComponent(path).absoluteString.removingPercentEncoding!
        print(urlString)
        let url = URL(string: urlString)

        var request = URLRequest(url: url!)
        request.method = method
       
            switch self {
            case let .showByShortName(parameters),let .testfunc(parameters):
                //request = try URLEncoding.default.encode(request, with: nil)
//                request = try URLEncodedFormParameterEncoder.default.encode(parameters,into: request)
                print(parameters)
                request = try JSONParameterEncoder().encode(parameters, into: request)
                
                //Post
            case let .forgotPassword(parameters),let .contactUs(parameters) ,let .registration(parameters) ,let .CompanyDetils(parameters),let .PasswordReset(parameters), let .organizers(parameters),let .SendOtp(parameters),let .ConferenceAgenda(parameters),let .login(parameters), let .MatchingRecruiter(parameters),let .ApplyJob(parameters),let .MatchingWebinars(parameters),let .MatchingCompanies(parameters),let .CompanyDerails(parameters),let .GoodieBags(parameters),let .CompnyGoodieBags(parameters),let .removeGoodie(parameters),let .FairSpeakersList(parameters),let .AvailableSlots(parameters), let .SlotsOfDate(parameters),let .RequestInterview(parameters),let .Schedules(parameters),let .CancelInterView(parameters),let .getCarrerTest(parameters),let .RecrutireCompanies(parameters),let .PollServay(parameters),let .GetExitSurvey(parameters),let .fairSurvey(parameters),let .MatchCheck(parameters),let .AddGoodie(parameters),let .extraFields(parameters):
//                request = try JSONParameterEncoder().encode(parameters, into: request)
                print(parameters)
                request = try URLEncodedFormParameterEncoder.default.encode(parameters,into: request)
                //Get
            case let .getDoctors(parameters),let .getSpecificInsurancePartener(parameters) ,let .getDeviceIDs(parameters) ,let .getNotificationsCount(parameters) ,let .getNotifications(parameters) ,let .getRecentBookings(parameters) ,let .getUpcomingBookings(parameters) ,let .getdoctorBookings(parameters) ,let .getSchedule(parameters) ,let .getOurPartners(parameters) ,let .getHospitals(parameters) ,let .getAboutCovid(parameters) ,let .getInsuranceNetwork(parameters),let .aboutUs(parameters) ,let .getSpecialities(parameters), let .getprofile(parameters), let .FairCompaniesList(parameters),let .Faqs(parameters) ,let .checkOtp(parameters),let .About(parameters),let .SpeakerDetails(parameters),let .WebinarDetails(parameters),let .recuiterDetails(parameters),let .ResendEmail(parameters),let .hallsCompaniesList(parameters),let .FairMedia(parameters),let .Receptionists(parameters),let .jobDetails(parameters),let .Accept(parameters),let .FairHalls(parameters),let .privacyPolicy(parameters):
                print(parameters)
                request = try URLEncodedFormParameterEncoder.default.encode(parameters,into: request)
              
            case .FairJobsList(let params),.UpdateProfile(let params), .saveCarrerTest(let params), .CompanyJobs(let params),.SaveSurvay(let params),.saveFairSurvey(let params),.MatchingJobs(let params):
                print(params)
                request = try JSONEncoding.prettyPrinted.encode(request, with: params)
//                request = try JSONParameterEncoder().encode(params, into: request)
            
            }
//        var langCode = ""
        let user = UserInfo()
//        if let lCode = UserDefaults.standard.value(forKey: "LanguageCode") as? String{
//            langCode = lCode
//            request.addValue("language_id", forHTTPHeaderField: langCode)
//
//        }
//        request.addValue("language_id", forHTTPHeaderField: langCode)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue(app_id, forHTTPHeaderField: "app-id")
//        request.addValue(app_key, forHTTPHeaderField: "app-key")
        request.addValue("Bearer \(user.token)", forHTTPHeaderField: "Authorization")
            print("request \(request)")

        return request
    }
}
//var app_id = "484182884209"
//var app_key = "$2y$10$i1ZeVSf.eHM/j5e3mHeqR.o8/HSy4Mpixbmkt9BEZuQpIOdqtajtC"

class ApiManager {
    static func callRestApi<T: Decodable>(url:URLRequestConvertible,myCustomClass : T.Type,completionHandler:@escaping((T?,String?)->()))
    {
//        AF.request(url).validate(statusCode:  200..<300)
        AF.request(url).responseDecodable(of: myCustomClass.self){ (response) in
            print("Res :- \(response)")
            switch response.result {
            case .success(let value):
                print(value)
                
                completionHandler(value,"\(response.response?.statusCode ?? 0)")
            case .failure(let error):
                print("Error :- \(error)")
                print("Status :- \((response.response?.statusCode ?? 0))")
                if (response.response?.statusCode ?? 0) == 204{
                completionHandler(nil,"\(response.response!.statusCode)")
                }else{
                    completionHandler(nil,response.error?.errorDescription)
                }

            }
        }
    }
}
struct URLS {
    static let baseUrl = "https://api-yas.broomstickcreative.com/api/"
    
    
    static var fairSpeakersList = "auth/fair/speakers/"
    static var fairCompaniesList = "api/auth/fair/exhibitors/"
    static var fairJobsList = "auth/fair/jobs/"
    static var imgUrl = "" //shortkeys?.data?.system_url?.assets_url ?? "https://vrd-2-assets-test.s3.eu-west-2.amazonaws.com/"//"https://vrd-2-assets-test.s3.eu-west-2.amazonaws.com/"
    static var Faqs = "api/auth/fair/faqs/"
    static var getCarrerTest = "fair/career/test/show/"
    static var useCarrerTest = ""
    static var speakerDetails = ""
    static var webinarDetails = "auth/fair/webinars/detail/"
    static var recuiterdetails = "api/auth/get/speaker/detail/"
    static var AvailableSlots = ""
    static var ResendEmail = ""
    static var hallsCompaniesList = ""
    static var jobDertails = ""
    static var accept = ""
    static var CompanuId = ""

    static var matchingJobs = "api/candidate/jobs"
    static var jobslist = "api/auth/fair/jobs"
    static var companyJobs = "api/candidate/company/jobs"
    static var getJobs = "api/auth/fair/jobs"


    static var company_Survey = "api/auth/company/poll"
    static var Fair_Survey = "api/auth/fair/survey"
    static var survey = ""
    static var privcayPolicy = "api/auth/fair/privacy/\(organizerID)"
    static var TermsConditioins = "api/auth/fair/terms/\(organizerID)"
    static var closeFairContent = "api/auth/fair/fairclosecontent/\(organizerID)"

    static var PreLiveContent = "api/auth/fair/prefairentercontent/\(organizerID)"

    static var afterRegistrationContent = "api/auth/fair/welcomecontentafterregistration/\(organizerID)"

    static var showTermsOrPricvacy = ""
    
    
}
//struct UsersLogin: Codable {
//    let userId: Int
//    let id: Int?
//    let title: String?
//    let completed: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case userId = "userId"
//        case id = "id"
//        case title = "title"
//        case completed = "completed"
//    }
//}

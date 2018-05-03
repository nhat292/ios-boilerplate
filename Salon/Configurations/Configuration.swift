struct Configuration {

}

struct SalonClientAPIKeys {
    #if DEBUG
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""

    #elseif STAGGING
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""

    #elseif RELEASE
        static let basePath = ""
        static let clientID = ""
        static let clientSecret = ""
    #endif
}

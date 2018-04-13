class Contact {
    var name: String
    var phone: String
    var mail: String
    init?(name: String, phone: String, mail: String) {
        if Int(phone) == nil {
            return nil
        }
        self.name = name
        self.phone = phone
        self.mail = mail
    }
    
    /*
    edit(...)-um verji 3 parametrnery grel em
    vor hnaravor lini override anel Business-um
    */
    func edit(name: String? = nil, 
              phone: String? = nil,
              mail: String? = nil, 
              workPhone: String? = nil, 
              workMail: String? = nil, 
              company: String? = nil) -> (Bool, Contact) {
        if let phone = phone {
            if Int(phone) == nil {
                return (false, self)
            }
            self.phone = phone
        }
        if let name = name {
            self.name = name
        }
        if let mail = mail {
            self.mail = mail
        }
        return (true, self)
    }
    func view() {
        print("Name       : \(name)")
        print("Phone      : \(phone)")
        print("Mail       : \(mail)")
    }
}

extension Contact: Hashable {
    var hashValue: Int {
        return phone.hashValue
    }
    static func ==(_ a: Contact,_ b: Contact) -> Bool {
        return a.hashValue == b.hashValue
    }
}

enum SortedType {
    case name
    case phone
}

class BusinessContact: Contact {
    var workPhone: String
    var workMail: String
    var company: String
    init?(name: String, phone: String, 
          mail: String, workPhone: String, 
          workMail: String, company: String) {
        if Int(workPhone) == nil {
            return nil
        }
        self.workPhone = workPhone
        self.workMail = workMail
        self.company = company
        super.init(name: name, phone: phone, mail: mail)
    }
    override func edit(name: String? = nil, 
              phone: String? = nil,
              mail: String? = nil, 
              workPhone: String? = nil, 
              workMail: String? = nil, 
              company: String? = nil) -> (Bool, BusinessContact) {
        if !super.edit(name: name, phone: phone, mail: mail).0 {
            return (false, self)
        }
        if let workPhone = workPhone {
            if Int(workPhone) == nil {
                return (false, self)
            }
            self.workPhone = workPhone
        }
        if let workMail = workMail {
            self.workMail = workMail
        }
        if let company = company {
            self.company = company
        }
        return (true, self)
    }
    override func view() {
        super.view()
        print("Work phone : \(workPhone)")
        print("Work mail  : \(workMail)")
        print("Company    : \(company)")
    }
}

class AddressBook {
    var contacts: Set<Contact>
    init() {
        contacts = []
    }
    var count: Int {
        return contacts.count
    }
    func getContact(name: String) -> Contact? {
        return contacts.first(where: { $0.name == name })
    }
    func getContact(phone: String) -> Contact? {
        return contacts.first(where: { $0.phone == phone })
    }
    func addContact(name: String, 
                    phone: String, 
                    mail: String) -> Contact? {
        guard let contact = Contact(name: name, 
                                    phone: phone, 
                                    mail: mail) else { return nil }
        contacts.insert(contact)
        return contact
    }
    func addBusinessContact(name: String, 
                            phone: String, 
                            mail: String, 
                            workPhone: String, 
                            workMail: String, 
                            company: String) -> BusinessContact? {
        guard let businessContact = BusinessContact(name: name, 
                                                    phone: phone, 
                                                    mail: mail, 
                                                    workPhone: workPhone, 
                                                    workMail: workMail, 
                                                    company: company) else { return nil }
        contacts.insert(businessContact)
        return businessContact
    }
    func edit(contact: Contact, 
              name: String? = nil, 
              phone: String? = nil,
              mail: String? = nil, 
              workPhone: String? = nil, 
              workMail: String? = nil, 
              company: String? = nil) -> (Bool, Contact)? {
        if !contacts.contains(contact) {
            return nil
        }
        return contact.edit(name: name, 
                            phone: phone,
                            mail: mail, 
                            workPhone: workPhone, 
                            workMail: workMail, 
                            company: company)
    }
    func removeContact(name: String) -> Contact? {
        guard let contact = getContact(name: name) else { return nil }
        return contacts.remove(contact)
    }
    func search(keyword: String) -> [Contact] {
        var res: [Contact] = []
        res = contacts.filter { $0.name.hasPrefix(keyword) }  
        // senc em arel vor skzbum et barov sksvoxnery beri

        for contact in contacts {
            if contact.name.hasPrefix(keyword) {   // chenq krknum
                continue
            }
            for i in contact.name.indices {
                if String(contact.name[i...]).hasPrefix(keyword) {
                    res.append(contact)
                    continue
                }
            }
        }
        return res
    }
    func search(phone: String) -> [Contact] {
         var res: [Contact] = []
        res = contacts.filter { $0.name.hasPrefix(phone) }  
        // senc em arel vor skzbum et barov sksvoxnery beri

        for contact in contacts {
            if contact.name.hasPrefix(phone) {   // chenq krknum
                continue
            }
            for i in contact.name.indices {
                if String(contact.name[i...]).hasPrefix(phone) {
                    res.append(contact)
                    continue
                }
            }
        }
        return res
    }
    func sort(by: SortedType) -> [Contact] {
        var res: [Contact] = []
        switch by {
            case .name:
            res = contacts.sorted(by: { $0.name > $1.name })
            case .phone:
            res = contacts.sorted(by: { $0.phone > $1.phone })
        }
        return res
    }
}


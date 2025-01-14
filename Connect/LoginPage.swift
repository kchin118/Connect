//
//  LoginPage.swift
//  Connect
//
//  Created by Nihal Memon on 4/29/23.
//

import SwiftUI

struct LoginPage: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var major = ""
    @State var social = ""
    @State var avatarSelection = "0"
    
    @State var firstNameMissing = false
    @State var lastNameMissing = false
    @State var majorMissing = false
    @State var socialMissing = false
    @State var avatarMissing = false
    
    @State var completed = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 1000)
                .foregroundColor(.themeCyan)
            
            Circle()
                .frame(width: 500)
                .foregroundColor(.white)
            
            
            VStack{
                Text("Sign Up")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding()
                    .padding(.top)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("First Name")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.top)
                        .padding(.leading, 5)
                    
                    TextField("Johnny", text: self.$firstName)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .border(self.firstNameMissing ?  Color.themeRed : Color.themeCyan, width: 2)
                    
                        
                    Text("Last Name")
                        .font(.title3)
                        .foregroundColor(.themeCyan)
                        .padding(.top)
                        .padding(.leading, 5)
                    
                    TextField("Appleseeds", text: self.$lastName)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .border(self.lastNameMissing ?  Color.themeRed : Color.themeCyan, width: 2)
                    
                    Text("Major")
                        .font(.title3)
                        .foregroundColor(.themeCyan)
                        .padding(.top)
                        .padding(.leading, 5)
                    
                    TextField("English", text: self.$major)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .border(self.majorMissing ?  Color.themeRed : Color.themeCyan, width: 2)
                    
                    Text("Social")
                        .font(.title3)
                        .foregroundColor(.themeCyan)
                        .padding(.top)
                        .padding(.leading, 5)
                    
                    TextField("@IG", text: self.$social)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .border(self.socialMissing ?  Color.themeRed : Color.themeCyan, width: 2)
                }
                
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.themeTan)
                            .frame(width: UIScreen.main.bounds.width / 3 + 7, height: UIScreen.main.bounds.width / 3 + 7)
                            .cornerRadius(10)
                            .opacity(avatarSelection == "0" ? 1.0 : 0.0)
                       
                        
                        Image("Avt1")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        
                    }
                    .onTapGesture {
                        self.avatarSelection = "0"
                    }
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.themeTan)
                            .frame(width: UIScreen.main.bounds.width / 3 + 7, height: UIScreen.main.bounds.width / 3 + 7)
                            .cornerRadius(10)
                            .opacity(avatarSelection == "1" ? 1.0 : 0.0)
                       
                        
                        Image("Avt2")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        
                    }
                    .onTapGesture {
                        self.avatarSelection = "1"
                    }
                    
                }
                .padding()
                .border(self.avatarMissing ?  Color.themeRed : Color.clear, width: 2)
                
                Button{
                    checkInput()
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.themeCyan)
                        .font(.title3)
                        
                        
                }
                .frame(width: UIScreen.main.bounds.width - 50)
                .padding(.vertical, 7)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.themeBlue)
        .fullScreenCover(isPresented: self.$completed) {
            HomePage()
        }
    }
    
    func checkInput(){
        withAnimation {
            if(self.firstName == ""){
                self.firstNameMissing = true
            } else {
                self.firstNameMissing = false
            }
            
            if(self.lastName == ""){
                self.lastNameMissing = true
            } else {
                self.lastNameMissing = false
            }
            
            if(self.major == ""){
                self.majorMissing = true
            } else {
                self.majorMissing = false
            }
            
            if(self.social == ""){
                self.socialMissing = true
            } else {
                self.socialMissing = false
            }
            
            if(self.avatarSelection == "2"){
                self.avatarMissing = true
            } else {
                self.avatarMissing = false
            }
        }
        
        if(!firstNameMissing && !lastNameMissing && !majorMissing && !socialMissing && !avatarMissing){
            UserDefaults.standard.set(firstName, forKey: "firstName")
            UserDefaults.standard.set(lastName, forKey: "lastName")
            UserDefaults.standard.set(major, forKey: "userMajor")
            UserDefaults.standard.set(avatarSelection, forKey: "imageSelection")
            UserDefaults.standard.set(social, forKey: "userSocial")
            UserDefaults.standard.set(true, forKey: "SignUpStat")
            
            self.completed = true
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

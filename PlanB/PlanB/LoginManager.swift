//
//  LoginManager.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore

class UserManager {
    
    static let shared = UserManager()
    var user: User?
    var activities: [[String : Any]] = []
    var planBOutdoor: [[String : Any]] = []
    var planBFood: [[String : Any]] = []
    var planBMovie: [[String : Any]] = []
    
    func addFirstActivities() {
        
        //test
        let outdoor: [String : Any] = ["activity_id": 0, "title": "簡報松二日遊", "type":"outdoor", "description": "由校友跨屆組成的隊伍，需要在 32 小時內發想創意、分工合作，實際動手開發出能解決真實問題的作品，為生活開創更多可能～ 最終成果將在粉專揭曉，敬請期待！", "actDate": "10", "actTh": "th", "actMonth": "June, Saturday", "actTime": "08:00 AM", "people": "30", "actPlace": "台北市信義區基隆路一段178號2樓", "coordinate" : (25.042468, 121.564879), "B" : false]
        let food: [String : Any] = ["activity_id": 1, "title": "飢餓32小時", "type":"food", "description": "由校友跨屆組成的隊伍，需要在 32 小時內發想創意、分工合作，為生命開創更多可能～ 還活著的人明天將在粉專揭曉，敬請期待！", "actDate": "11", "actTh": "th", "actMonth": "January, Sunday", "actTime": "06:00 AM", "people": "15", "actPlace": "台北市信義區基隆路一段180號", "coordinate" : (25.042468, 121.564879), "B" : false]
        let movie: [String : Any] = ["activity_id": 2, "title": "大尾鱸鰻奇觀", "type":"movie", "description": "探索IMDB評價極限，讓你大開眼界", "actDate": "01", "actTh": "st", "actMonth": "March, Thursday", "actTime": "04:20 PM", "people": "4", "actPlace": "台北市信義區華納威秀", "coordinate" : (25.035506, 121.567136), "B" : false]
        
        self.activities.append(outdoor)
        self.activities.append(food)
        self.activities.append(movie)
    }
    
    func addOutdoorActivities() {
        
        //test
        let plan1: [String : Any] = ["activity_id": 0, "title": "珍煮丹喝到飽", "type":"food", "description": "在屋簷下喝曾祖母煮的黑糖珍珠奶茶，多愜意", "actPlace": "台北市信義區基隆路一段178號2樓", "coordinate" : (25.042468, 121.564879), "actDate": "10", "actTh": "th", "actMonth": "June, Saturday", "actTime": "08:00 AM", "people": "30", "B" : true]
        let plan2: [String : Any] = ["activity_id": 1, "title": "小7血拼", "type":"shopping", "description": "小七就在樓下，拿起悠遊卡，當SOGO一樣好好逛", "actPlace": "台北市信義區基隆路一段180號", "coordinate" : (25.042468, 121.564879), "actDate": "10", "actTh": "th", "actMonth": "June, Saturday", "actTime": "08:00 AM", "people": "30", "B" : true]
        let plan3: [String : Any] = ["activity_id": 2, "title": "台北物語好好看", "type":"movie", "description": "大家都看，你不看嗎", "actPlace": "台北市信義區華納威秀", "coordinate" : (25.035506, 121.567136), "actDate": "10", "actTh": "th", "actMonth": "June, Saturday", "actTime": "08:00 AM", "people": "30", "B" : true]
        let plan4: [String : Any] = ["activity_id": 3, "title": "健身房巡迴", "type":"sport", "description": "坐著久了，屁股會變大", "actPlace": "台北市信義區WorldGym", "coordinate" : (25.035506, 121.567136), "actDate": "10", "actTh": "th", "actMonth": "June, Saturday", "actTime": "08:00 AM", "people": "30", "B" : true]
        let plan5: [String : Any] = ["activity_id": 4, "title": "待在家", "type":"sport", "description": "雨一直下，還是洗洗睡吧", "actPlace": "你家", "coordinate" : (25.035506, 121.567136), "actDate": "10", "actTh": "th", "actMonth": "June, Saturday", "actTime": "08:00 AM", "people": "30", "B" : true]
        
        self.planBOutdoor.append(plan1)
        self.planBOutdoor.append(plan2)
        self.planBOutdoor.append(plan3)
        self.planBOutdoor.append(plan4)
        self.planBOutdoor.append(plan5)
    }

    func addFoodActivities() {
        
        //test
        let plan1: [String : Any] = ["activity_id": 0, "title": "去去星巴克", "type":"food", "description": "你剛選的那家看起來很爛，換這個吧！", "actPlace": "台北市信義區阪急百貨星巴克", "coordinate" : (25.042468, 121.564879), "actDate": "11", "actTh": "th", "actMonth": "January, Sunday", "actTime": "06:00 AM", "people": "15", "B" : true]
        let plan2: [String : Any] = ["activity_id": 1, "title": "馬辣煮的最好吃", "type":"food", "description": "By the way，你為什麼不自己煮？", "actPlace": "馬辣辣辣辣", "coordinate" : (25.042468, 121.564879), "actDate": "11", "actTh": "th", "actMonth": "January, Sunday", "actTime": "06:00 AM", "people": "15", "B" : true]
        let plan3: [String : Any] = ["activity_id": 2, "title": "電影配爆米花", "type":"movie", "description": "說不定吉拿棒都比你選的餐廳好吃", "actPlace": "台北市信義區華納威秀", "coordinate" : (25.035506, 121.567136), "actDate": "11", "actTh": "th", "actMonth": "January, Sunday", "actTime": "06:00 AM", "people": "15", "B" : true]
        let plan4: [String : Any] = ["activity_id": 3, "title": "Roy家觀光", "type":"sport", "description": "Roy豪華住宅任你逛", "actPlace": "Roy家", "coordinate" : (25.035506, 121.567136), "actDate": "11", "actTh": "th", "actMonth": "January, Sunday", "actTime": "06:00 AM", "people": "15", "B" : true]
        let plan5: [String : Any] = ["activity_id": 4, "title": "跑跑步", "type":"sport", "description": "照照鏡子，好嗎", "actPlace": "台北市信義區WorldGym", "coordinate" : (25.035506, 121.567136), "actDate": "11", "actTh": "th", "actMonth": "January, Sunday", "actTime": "06:00 AM", "people": "15", "B" : true]

        self.planBFood.append(plan1)
        self.planBFood.append(plan2)
        self.planBFood.append(plan3)
        self.planBFood.append(plan4)
        self.planBFood.append(plan5)
    }

    func addMovieActivities() {
        
        //test
        let plan1: [String : Any] = ["activity_id": 0, "title": "看見台灣", "type":"movie", "description": "來點有意義的騙子吧！", "actPlace": "台北市信義區華納威秀", "coordinate" : (25.035506, 121.567136), "actDate": "01", "actTh": "st", "actMonth": "March, Thursday", "actTime": "04:20 PM", "people": "4", "B" : true]
        let plan2: [String : Any] = ["activity_id": 1, "title": "神力女超人", "type":"movie", "description": "推薦你，雖然我們也沒看過", "actPlace": "你家", "coordinate" : (25.042468, 121.564879), "actDate": "01", "actTh": "st", "actMonth": "March, Thursday", "actTime": "04:20 PM", "people": "4", "B" : true]
        let plan3: [String : Any] = ["activity_id": 2, "title": "Discovery", "type":"movie", "description": "偶爾也要長點知識", "actPlace": "別人家", "coordinate" : (25.035506, 121.567136), "actDate": "01", "actTh": "st", "actMonth": "March, Thursday", "actTime": "04:20 PM", "people": "4", "B" : true]
        let plan4: [String : Any] = ["activity_id": 3, "title": "國家地理頻道", "type":"movie", "description": "長長知識好開心", "actPlace": "自己家", "coordinate" : (25.035506, 121.567136), "actDate": "01", "actTh": "st", "actMonth": "March, Thursday", "actTime": "04:20 PM", "people": "4", "B" : true]
        let plan5: [String : Any] = ["activity_id": 4, "title": "紅油炒手麵", "type":"food", "description": "美食沙漠裡的一朵玫瑰", "actPlace": "信義區小巷子", "coordinate" : (25.035506, 121.567136), "actDate": "01", "actTh": "st", "actMonth": "March, Thursday", "actTime": "04:20 PM", "people": "4", "B" : true]
        
        self.planBMovie.append(plan1)
        self.planBMovie.append(plan2)
        self.planBMovie.append(plan3)
        self.planBMovie.append(plan4)
        self.planBMovie.append(plan5)
    }
}

extension UserManager {
    
    typealias LoginResult = (Bool) -> Void
    
    func login(loginResult: @escaping LoginResult) {
        
        let loginManager = LoginManager()
        
        loginManager.logIn([.publicProfile, .userFriends, .email], viewController: nil) { result in
            
            switch result {
                
            case .success(grantedPermissions: _, declinedPermissions: _, token: let accessToken):
                
                let request = GraphRequest(graphPath: "me", parameters: ["fields":"email, name, picture"], accessToken: accessToken, httpMethod: .POST, apiVersion: .defaultVersion)
                
                let connection = GraphRequestConnection()
                
                connection.add(request) { (response, result) in
                    
                    switch result {
                        
                    case .success(response: let response):
                        guard let dictionary = response.dictionaryValue else { return }
                        self.user = User(dictionary: dictionary)
                        loginResult(true)
                        
                    case .failed(let error):
                        print("Login - \(error)")
                        loginResult(false)
                    }
                }
                
            case .failed(let error):
                print("Login - \(error)")
                loginResult(false)
                
            case .cancelled:
                print("Login - cancelled")
                loginResult(false)
            }
        }
    }
}

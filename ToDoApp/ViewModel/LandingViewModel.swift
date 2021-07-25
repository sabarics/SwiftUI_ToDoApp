//
//  LandingViewModel.swift
//  ToDoApp
//
//  Created by Sabari on 22/07/21.
//

import Foundation
import SwiftUI


class LandingViewModel: ObservableObject {
    
    @Published var taskList:[TaskList] = [
    ]
    @Published var taskArray:[Task] = []
    
    
    /// Task Mock Data
    func getTaskList(){
        let taskList = [
            TaskList(categoryName: "All", noOfTasks: 53, categoryImage: Image("task_all"), categoryId: 0),
            TaskList(categoryName: "Work", noOfTasks: 2, categoryImage: Image("task_work"), categoryId: 1),
            TaskList(categoryName: "Music", noOfTasks: 15, categoryImage: Image("task_music"), categoryId: 2),
            TaskList(categoryName: "Travel", noOfTasks: 18, categoryImage: Image("task_travel"), categoryId: 3),
            TaskList(categoryName: "Study", noOfTasks: 2, categoryImage: Image("task_study"), categoryId: 4),
            TaskList(categoryName: "Home", noOfTasks: 5, categoryImage: Image("task_home"), categoryId: 5),
            TaskList(categoryName: "Shopping", noOfTasks: 11, categoryImage: Image("task_shopping"), categoryId: 6)
        ]
        
        self.taskList = taskList
    }
    
    
    /// Generate task List
    /// - Returns: will return [TaskList]
    func getAllTaskList() -> [TaskList]
    {
        var taskList: [TaskList] = []
        self.taskArray = CoreDataManager.shared.getAllTask()
        
        for obj in self.taskArray{
            let filteredValue = taskList.firstIndex{
                $0.categoryId == obj.taskCategoryID
            }
            if let index = filteredValue{
                taskList[index].taskList.append(obj)
                taskList[index].noOfTasks = taskList[index].taskList.count
            }
            else{
                taskList.append(TaskList(categoryName: obj.taskCategoryName, noOfTasks: 1, categoryImage: getCategoryImage(categoryName: obj.taskCategoryName ?? ""), categoryId: Int(obj.taskCategoryID), isShow: true, taskList: [obj]))
            }
        }
        
        if self.taskArray.count > 1{
            taskList.insert(TaskList(categoryName: "All", noOfTasks:self.taskArray.count , categoryImage: getCategoryImage(categoryName: "All"), categoryId: 0, isShow: true, taskList: self.taskArray), at: 0)
        }
        
        return taskList
    }
    
    
    /// Get categoryImage from category name
    /// - Parameter categoryName: Category Name
    /// - Returns: will return Category Image
    func getCategoryImage(categoryName:String) -> Image{
        switch categoryName {
        case "All":
            return Image("task_all")
        case "Work":
            return Image("task_work")
        case "Music":
            return Image("task_music")
        case "Travel":
            return Image("task_travel")
        case "Study":
            return Image("task_study")
        case "Home":
            return Image("task_home")
        case "Shopping":
            return Image("task_shopping")
        case "Shoping":
            return Image("task_shopping")
        case "Gift":
            return Image("task_gift")
        case "Ideas":
            return Image("task_ideas")
        case "Payment":
            return Image("task_payment")
        case "Cooking":
            return Image("task_cooking")
        case "Health":
            return Image("task_health")
        case "Finance":
            return Image("task_finance")
        case "Others":
            return Image("task_others")
        default:
            return Image("task_all")
        }
    }
    
}



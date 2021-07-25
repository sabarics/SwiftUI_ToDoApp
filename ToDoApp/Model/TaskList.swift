//
//  TaskList.swift
//  ToDoApp
//
//  Created by Sabari on 22/07/21.
//

import Foundation
import SwiftUI

struct TaskList {
    var categoryName:String!
    var noOfTasks:Int!
    var categoryImage:Image!
    var categoryId:Int!
    var isShow:Bool = false
    var taskList:[Task] = []
}

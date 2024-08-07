//
//  IssueReportViewModel.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 8/5/24.
//

import Foundation


class IssueReportViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var email = ""
    @Published var name = ""
    @Published var description = ""
    
}

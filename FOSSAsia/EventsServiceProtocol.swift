//
//  EventsServiceProtocol.swift
//  FOSSAsia
//
//  Created by Jurvis Tan on 1/2/16.
//  Copyright © 2016 FossAsia. All rights reserved.
//

import Foundation

typealias EventCompletionHandler = ([Event]?, Error?) -> Void

protocol EventsServiceProtocol {
    func retrieveEventsInfo(date: NSDate?, trackIds: [Int]?, completionHandler: EventCompletionHandler)
    func toggleFavorite(sessionId: Int, completionHandler: EventsServiceCommitmentCompletionHandler)
}
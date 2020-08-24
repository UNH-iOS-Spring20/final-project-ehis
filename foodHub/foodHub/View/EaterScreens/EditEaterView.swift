//
//  EditEaterView.swift
//  foodHub
//
//  Created by Ehiremen Ekore on 8/23/20.
//  Copyright © 2020 Ekore, Ehiremen Alex. All rights reserved.
//

import SwiftUI

struct EditEaterView: View {
    @ObservedObject var eater: EaterUser
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EditEaterView_Previews: PreviewProvider {
    static var previews: some View {
        EditEaterView(eater: EaterUser.example)
    }
}

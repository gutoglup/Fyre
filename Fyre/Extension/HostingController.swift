//
//  HostingController.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 25/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView: View  {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

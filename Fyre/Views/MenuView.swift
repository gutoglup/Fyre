//
//  MenuView.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 28/04/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI
import QGrid

struct MenuView: View {
    var options: [Menu] = [
        Menu(id: 0, name: "Civilizations", description: "The civilizations history"),
        Menu(id: 1, name: "Units", description: "The unit description"),
        Menu(id: 2, name: "Structures", description: "The structures types of game"),
        Menu(id: 3, name: "Tecnologies", description: "The tecnologies and evolutions")
    ]
    @State var isListCivilizationsViewPushed = false
    @State var isListUnitsViewPushed = false
    @State var isListStructuresViewPushed = false
    @State var isListTecnologiesViewPushed = false
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "background")
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "title") ?? .white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "title") ?? .white]
    }
    
    var body: some View {
        ZStack{
            VStack() {
                Rectangle()
                    .foregroundColor(Color("background"))
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 0)
                
                NavigationView {
                    VStack {
                        QGrid(options, columns: 2) { content in
                            GridCell(option: content).onTapGesture {
                                self.onPressButton(menu: content)
                            }
                        }
                        
                        NavigationLink(destination: ListCivilizationsView(), isActive: $isListCivilizationsViewPushed) {
                            EmptyView()
                        }.hidden()
                        NavigationLink(destination: ListUnitsView(), isActive: $isListUnitsViewPushed) {
                            EmptyView()
                        }.hidden()
                        NavigationLink(destination: ListStructuresView(), isActive: $isListStructuresViewPushed) {
                            EmptyView()
                        }.hidden()
                        NavigationLink(destination: ListTechnologiesView(), isActive: $isListTecnologiesViewPushed) {
                            EmptyView()
                        }.hidden()
                    }.navigationBarTitle("Fyre")
                        .background(Color("background"))
                    }.background(Color("background"))
                .onAppear {
                    self.viewDidAppear()
                }
            }
            .background(Color("background"))
        }
    }
    
    func viewDidAppear() {
        self.isListCivilizationsViewPushed = false
        self.isListUnitsViewPushed = false
        self.isListStructuresViewPushed = false
        self.isListTecnologiesViewPushed = false
    }
    
    func onPressButton(menu: Menu) {
        switch menu.id {
        case 0: self.isListCivilizationsViewPushed = true
        case 1: self.isListUnitsViewPushed = true
        case 2: self.isListStructuresViewPushed = true
        case 3: self.isListTecnologiesViewPushed = true
        default: break
        }
    }
}

struct GridCell: View {
    var option: Menu
    var body: some View {
        VStack() {
            Text(option.name)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(Color("title"))
                .padding(.top, 12)
                .padding(.horizontal, 8)
                .padding(.bottom, 6)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(option.description)
                .foregroundColor(Color("subtitle"))
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
                .multilineTextAlignment(.center)
                .font(.caption)
                .lineLimit(2)
                .layoutPriority(1)
            Spacer().frame(minHeight: 0,  maxHeight: 60)
        }
        .background(Color("backgroundCell"))
        .cornerRadius(12)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

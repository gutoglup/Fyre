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
        Menu(id: 0, name: "Structures", description: "The structures types of game"),
        Menu(id: 0, name: "Technologies", description: "The technologies and evolutions")
    ]
    @State var isListCivilizationsViewPushed = false
    @State var isListUnitsViewPushed = false
    
    var body: some View {
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
            }.navigationBarTitle("Fyre")
        }
        .background(Color("background"))
        .onAppear {
            self.viewDidAppear()
        }
    }
    
    func viewDidAppear() {
        self.isListCivilizationsViewPushed = false
        self.isListUnitsViewPushed = false
    }
    
    func onPressButton(menu: Menu) {
        switch menu.id {
        case 0: self.isListCivilizationsViewPushed = true
        case 1: self.isListUnitsViewPushed = true
        default: break
        }
    }
}

struct GridCell: View {
    var option: Menu
    var body: some View {
        //        NavigationLink(destination: CivilizationDetailView()) {
        VStack() {
            Text(option.name)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(Color("title"))
                .padding(.top, 12)
                .padding(.horizontal, 8)
                .padding(.bottom, 6)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(option.description)
                .foregroundColor(.gray)
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
    //    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

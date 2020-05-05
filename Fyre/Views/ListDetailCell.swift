//
//  ListDetailCell.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 05/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI

struct ListDetailCell: View {
    @Binding var name: String?
    @Binding var expansion: String?
    
    var body: some View {
        HStack {
            VStack(alignment: HorizontalAlignment.leading) {
                
                Text(name ?? "")
                    .foregroundColor(Color("title"))
                    .padding(.bottom, 4)
                Text(expansion ?? "")
                    .font(.subheadline)
                    .foregroundColor(Color("subtitle"))
            }
            
            Spacer()
        }
        .cornerRadius(10)
        .background(Color("backgroundCell"))
    }
}

struct ListDetailCell_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ListDetailCell(name: .constant("Teste"), expansion: .constant("Teste"))
        }.previewLayout(.sizeThatFits)
    }
}


//
//  ContentView.swift
//  Demoapp
//
//  Created by vivek bajirao deshmukh on 17/04/20.
//  Copyright © 2020 vivek bajirao deshmukh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetcher = MovieFetcher()
    let rows = Rows.init(dictionary: [:])
    
    var body: some View {
        
        List() {
            HikeCell(hike: self.rows!)
        }.onAppear(perform: self.fetcher.load)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct HikeCell: View {
    
    let hike: Rows
    
    var body: some View {
        HStack {
            Image(hike.imageHref ?? "")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            
            VStack(alignment: .leading) {
                Text(hike.title ?? "")
                Text(hike.description ?? "")
            }
        }
    }
}

//
//  StraggeredGrid.swift
//  StaggeredGrid
//
//  Created by Michele Manniello on 04/08/21.
//

import SwiftUI

//Custom View Builder...

//T -> is to hold the identifiable collection of data...


struct StraggeredGrid<Content: View, T : Identifiable> : View  where T : Hashable{
    
// it will return each object from collection to build View...
    var content : (T) -> Content
    
    var list : [T]
    
// Colnumns.....
    var columns : Int
    
//    Properties....
    var showsIndicator: Bool
    var spacing : CGFloat
    
    init(columns: Int,showsIndicator: Bool  = false,spacing: CGFloat = 10 ,list : [T], @ViewBuilder content: @escaping (T) ->Content){
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicator = showsIndicator
        self.columns = columns
    }

    var body: some View {
        HStack(alignment: .top,spacing: 20){
            ForEach(setupList(),id: \.self){ columnsData in
//                For Optimized Using lazyStack...
                LazyVStack(spacing: spacing){
                    ForEach(columnsData){object in
                        content(object)
                    }
                }
                .padding(.top,getIndex(values: columnsData) == 1 ? 80 : 0)
            }
        }
//        only vaertical padding...
//        horizontal padding will be user's optional...
        .padding(.vertical)
    }
    
    func getIndex(values: [T])->Int{
        let index = setupList().firstIndex { t in
            return t == values
        } ?? 0
        
        return index
    }
    
    //    Straggered Grid Function...
    func setupList()->[[T]]{
//        creating empty sub array of columns count...
        var gridArray : [[T]] = Array(repeating: [], count: columns)
//        spilitng array for VStack oriented View...
        var currentIndex :Int = 0
        for object in list{
            gridArray[currentIndex].append(object)
//            increasing index count...
//            and resetting if overbounds the columns count...
            if currentIndex == (columns - 1){
                currentIndex = 0
            }else{
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    
}


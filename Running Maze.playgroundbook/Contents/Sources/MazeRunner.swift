//
//  MazeRunner.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation

public class MazeRunner {
    public struct Step {
        let coordinateDetails: CoordinateDetails
        let coordinate: Coordinate
        let searchCount: Int
        let isAnimated: Bool
    }
    
    public let maze: Maze
    
    fileprivate(set) public var steps = [Step]()
    
    public init(layout: MazeLayout) {
        maze = Maze(layout: layout)
        maze.delegate = self
    }
    
    public func run(userCode: @escaping ((Maze) -> Void)) {
        userCode(maze)
    }
}

extension MazeRunner: MazeDelegate {
    func maze(_ maze: Maze, didUpdate coordinate: Coordinate, from oldDetails: CoordinateDetails?, to newDetails: CoordinateDetails?) {
        guard let oldDetails = oldDetails, let newDetails = newDetails else { return }
        
        let step = Step(
            coordinateDetails: newDetails,
            coordinate: coordinate,
            searchCount: maze.searchCount,
            isAnimated: oldDetails.isSearched != newDetails.isSearched)
        
        steps.append(step)
    }
}

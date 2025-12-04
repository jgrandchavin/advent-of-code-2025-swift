//
//  Dial.swift
//  AdventOfCode2025
//
//  Created by Ju on 03/12/2025.
//

struct Dial {
    let range: ClosedRange<Int>
    private(set) var position: Int

    init(range: ClosedRange<Int>, startPosition: Int) {
        precondition(
            range.contains(startPosition),
            "Start must be within range"
        )
        self.range = range
        self.position = startPosition
    }

    /// Applies a move and returns the resulting position and the number of zero crossings.
    /// - Parameters:
    ///   - steps: Number of steps to move (non-negative).
    ///   - direction: Direction of the move.
    /// - Returns: The new position
    private func applyMove(
        steps: Int,
        direction: Direction
    ) -> Int {
        precondition(steps >= 0, "steps must be non-negative")
        if steps == 0 {
            return self.position
        }

        let span = range.upperBound - range.lowerBound + 1
        if span <= 1 {
            return self.position
        }

        let zeroBasedCurrent = self.position - range.lowerBound
        let normalizedSteps = steps % span
        let signedDelta =
            (direction == .left) ? -normalizedSteps : normalizedSteps
        let newZeroBased = (zeroBasedCurrent + signedDelta + span) % span
        let newPosition = range.lowerBound + newZeroBased

        return newPosition
    }

    mutating func setPosition(direction: Direction, steps: Int) -> Int {
        assert(steps >= 0, "steps must be non-negative")
        let result = applyMove(
            steps: steps,
            direction: direction
        )
        self.position = result
        return result
    }
}

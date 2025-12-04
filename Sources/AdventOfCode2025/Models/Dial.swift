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

    /// Counts how many times the dial points at 0 during this move.
    /// We count each time an intermediate step lands exactly on 0 (including if the final position is 0).
    // Returns how many times the dial will land on 0 during the move.
    private func zeroCrossCount(from currentPosition: Int, steps: Int, direction: Direction) -> Int {
        // No movement or dial has no space: can't cross zero
        if steps == 0 { return 0 }
        let totalPositions = range.upperBound - range.lowerBound + 1
        if totalPositions <= 1 { return 0 }

        var count = 0
        var pos = currentPosition

        for _ in 1...steps {
            // Move one step in the given direction
            if direction == .right {
                pos += 1
                if pos > range.upperBound {
                    pos = range.lowerBound
                }
            } else {
                pos -= 1
                if pos < range.lowerBound {
                    pos = range.upperBound
                }
            }
            if pos == 0 {
                count += 1
            }
        }
        return count
    }

    /// Applies a move and returns the resulting position.
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

    mutating func setPosition(direction: Direction, steps: Int) -> (position: Int, crossesZero: Int) {
        assert(steps >= 0, "steps must be non-negative")
        // Count crosses from the current position before mutating
        let crosses = zeroCrossCount(from: self.position, steps: steps, direction: direction)
        let newPosition = applyMove(
            steps: steps,
            direction: direction
        )
        self.position = newPosition
        return (position: newPosition, crossesZero: crosses)
    }
}

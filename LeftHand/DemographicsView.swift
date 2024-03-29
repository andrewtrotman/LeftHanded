/*
	DemographicsView.swift
*/

import Foundation
import SwiftUI
import PencilKit

struct DemographicsView: View
	{
	@State var parent: LeftHandApp
	@State var result: User

	var sexes = ["Male", "Female", "Non-Binary", "Withheld"]
	@State var selectedSex: String

	var ages = ["1-10", "11-20", "21-30", "31-40", "41-50", "51-60", "61-70", "71-80", "81-90", ">90", "Withheld"]
	@State var selectedAge: String

	var handedness = ["Left", "Right", "Ambidextrous", "Withheld"]
	@State var selectedHandedness: String

	var writingHand = ["Left", "Right", "Ambidextrous", "Withheld"]
	@State var selectedWritingHand: String

	var educationLevel = ["School", "Batchelor", "Masters", "PhD", "Withheld"]
	@State var selectedEducationLevel: String

	init(_ parent: LeftHandApp, result : User)
		{
		_parent = State(initialValue: parent)
		self.result = result
		self.selectedSex = result.sex
		self.selectedAge = result.age
		self.selectedHandedness = result.handedness
		self.selectedWritingHand = result.writingHand
		self.selectedEducationLevel = result.educationLevel
		}

    var body: some View
		{
		Spacer()
		Group
			{
			Image("OtagoLogo")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width:100)
			Text("University of Otago").font(.largeTitle)
			Text("Writing Experiment").font(.largeTitle)
			Text("").font(.largeTitle)
			Text("Please provide a little information about yourself").font(.title)
			}
		Spacer()
		Group
			{
			HStack
				{
				Spacer().frame(width:20)
				Text("Sex:").font(.title)
				Spacer()
				}
			HStack
				{
				Spacer().frame(width:40)
				Picker("Sex:", selection: $selectedSex)
					{
					ForEach(sexes, id: \.self)
						{
						Text($0)
						}
					}.pickerStyle(SegmentedPickerStyle())
				Spacer()
				}
			Spacer()
			}

		Group
			{
			HStack
				{
				Spacer().frame(width:20)
				Text("Age:").font(.title)
				Spacer()
				}
			HStack
				{
				Spacer().frame(width:40)
				Picker("Age:", selection: $selectedAge)
					{
					ForEach(ages, id: \.self)
						{
						Text($0)
						}
					}.pickerStyle(SegmentedPickerStyle())
				Spacer()
				}
			Spacer()
			}

		Group
			{
			HStack
				{
				Spacer().frame(width:20)
				Text("Writing Hand:").font(.title)
				Spacer()
				}
			HStack
				{
				Spacer().frame(width:40)
				Picker("Writing Hand:", selection: $selectedWritingHand)
					{
					ForEach(writingHand, id: \.self)
						{
						Text($0)
						}
					}.pickerStyle(SegmentedPickerStyle())
				Spacer()
				}
			Spacer()
			}

		Group
			{
			HStack
				{
				Spacer().frame(width:20)
				Text("Handedness:").font(.title)
				Spacer()
				}
			HStack
				{
				Spacer().frame(width:40)
				Picker("Handedness:", selection: $selectedHandedness)
					{
					ForEach(handedness, id: \.self)
						{
						Text($0)
						}
					}.pickerStyle(SegmentedPickerStyle())
				Spacer()
				}
			Spacer()
			}

		Group
			{
			HStack
				{
				Spacer().frame(width:20)
				Text("Highest Qualification:").font(.title)
				Spacer()
				}
			HStack
				{
				Spacer().frame(width:40)
				Picker("EducationLevel:", selection: $selectedEducationLevel)
					{
					ForEach(educationLevel, id: \.self)
						{
						Text($0)
						}
					}.pickerStyle(SegmentedPickerStyle())
				Spacer()
				}
			Spacer()
			}

		Group
			{
			Spacer()
			HStack
				{
				Spacer()
				Button("Continue...")
					{
					parent.coordinator.screen = Screen.writings

					result.sex = selectedSex
					result.age = selectedAge
					result.handedness = selectedHandedness
					result.writingHand = selectedWritingHand
					result.educationLevel = selectedEducationLevel
					}
					.padding()
					.foregroundColor(.white)
					.background(Color.blue.opacity(0.5))
					.clipShape(RoundedRectangle(cornerRadius: 5))
				Spacer().frame(width:20)
				Button("QUIT")
					{
					parent.person.rewind()
					parent.coordinator.screen = Screen.conset
					}
					.padding()
					.foregroundColor(.white)
					.background(Color.red.opacity(0.5))
					.clipShape(RoundedRectangle(cornerRadius: 5))
				Spacer()
				}
			Spacer()
			}
		}
	}


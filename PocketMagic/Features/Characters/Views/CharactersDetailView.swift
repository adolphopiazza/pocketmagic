//
//  CharactersDetailView.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 08/10/23.
//

import SwiftUI

struct CharactersDetailView: View {
    
    let characterModel: CharactersModel
    
    var body: some View {
        Form {
            imageView
            
            basicDataView
            
            wandView
            
            alternateNameView
            
            alternateActorsView
        }
        .navigationTitle(characterModel.name)
    }
    
    private var imageView: some View {
        Section {
            if !characterModel.image.isEmpty {
                AsyncImage(url: URL(string: characterModel.image)) { image in
                    HStack {
                        Spacer()
                        
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250, alignment: .center)
                        
                        Spacer()
                    }
                } placeholder: {
                    Text("Loading image...")
                        .foregroundStyle(.gray)
                }
            } else {
                ContentUnavailableView("No image", systemImage: "photo")
            }
        }
    }
    
    private var basicDataView: some View {
        Section("About") {
            CharactersDetailRowView(leadingText: "Species", trailingText: characterModel.species)
            CharactersDetailRowView(leadingText: "Gender", trailingText: characterModel.gender)
            CharactersDetailRowView(leadingText: "House", trailingText: characterModel.house)
            CharactersDetailRowView(leadingText: "Date of Birth", trailingText: formatDate())
            CharactersDetailRowView(leadingText: "Wizard", trailingText: characterModel.wizard ? "✅" : "🚫")
            CharactersDetailRowView(leadingText: "Ancestry", trailingText: characterModel.ancestry)
            CharactersDetailRowView(leadingText: "Eye Colour", trailingText: characterModel.eyeColour)
            CharactersDetailRowView(leadingText: "Hair Colour", trailingText: characterModel.hairColour)
            CharactersDetailRowView(leadingText: "Patronus", trailingText: characterModel.patronus)
            CharactersDetailRowView(leadingText: "Hogwarts Student", trailingText: characterModel.hogwartsStudent ? "✅" : "🚫")
            CharactersDetailRowView(leadingText: "Hogwarts Staff", trailingText: characterModel.hogwartsStaff ? "✅" : "🚫")
            CharactersDetailRowView(leadingText: "Actor", trailingText: characterModel.actor)
            CharactersDetailRowView(leadingText: "Alive", trailingText: characterModel.alive ? "✅" : "🚫")
        }
    }
    
    private var wandView: some View {
        Section("Wand") {
            if let wand = characterModel.wand, !wand.wood.isEmpty {
                CharactersDetailRowView(leadingText: "Wood", trailingText: wand.wood)
                CharactersDetailRowView(leadingText: "Core", trailingText: wand.core)
                CharactersDetailRowView(leadingText: "Length", trailingText: String(wand.length ?? 0.0))
            } else {
                ContentUnavailableView("No wand data", systemImage: "wand.and.rays")
                    .symbolVariant(.slash)
            }
        }
    }
    
    private var alternateNameView: some View {
        Section("Alternate Names") {
            if let alternateNames = characterModel.alternateNames, alternateNames.count != 0 {
                ForEach(alternateNames, id: \.self) { name in
                    Text(name)
                }
            } else {
                ContentUnavailableView("No alternate names", systemImage: "abc")
            }
        }
    }
    
    private var alternateActorsView: some View {
        Section("Alternate Actors") {
            if let alternateActors = characterModel.alternateActors, alternateActors.count != 0 {
                ForEach(alternateActors, id: \.self) { actor in
                    Text(actor)
                }
            } else {
                ContentUnavailableView("No alternate actors", systemImage: "figure.socialdance")
            }
        }
    }
    
}

// MARK: - Private functions
extension CharactersDetailView {
    
    private func formatDate() -> String {
        guard let dobString = characterModel.dateOfBirth else {
            return "No birthday data"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        if let dob = formatter.date(from: dobString) {
            formatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            return formatter.string(from: dob)
        }
        
        return "No birthday data"
    }
    
}

#Preview("Light Mode") {
    CharactersDetailView(characterModel: .init(id: UUID(),
                                               name: "Harry Potter",
                                               alternateNames: ["The Boy Who Lived",
                                                                "The Chosen One"],
                                               species: "human",
                                               gender: "male",
                                               house: "Gryffindor",
                                               dateOfBirth: "31-07-1980",
                                               yearOfBirth: 1980,
                                               wizard: true,
                                               ancestry: "half-blood",
                                               eyeColour: "green",
                                               hairColour: "black",
                                               wand: .init(wood: "holly",
                                                           core: "phoenix feather",
                                                           length: 11),
                                               patronus: "stag",
                                               hogwartsStudent: true,
                                               hogwartsStaff: false,
                                               actor: "Daniel Radcliffe",
                                               alternateActors: nil,
                                               alive: true,
                                               image: "https://ik.imagekit.io/hpapi/harry.jpg"))
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    CharactersDetailView(characterModel: .init(id: UUID(),
                                               name: "Harry Potter",
                                               alternateNames: ["The Boy Who Lived",
                                                                "The Chosen One"],
                                               species: "human",
                                               gender: "male",
                                               house: "Gryffindor",
                                               dateOfBirth: "31-07-1980",
                                               yearOfBirth: 1980,
                                               wizard: true,
                                               ancestry: "half-blood",
                                               eyeColour: "green",
                                               hairColour: "black",
                                               wand: .init(wood: "holly",
                                                           core: "phoenix feather",
                                                           length: 11),
                                               patronus: "stag",
                                               hogwartsStudent: true,
                                               hogwartsStaff: false,
                                               actor: "Daniel Radcliffe",
                                               alternateActors: nil,
                                               alive: true,
                                               image: "https://ik.imagekit.io/hpapi/harry.jpg"))
        .preferredColorScheme(.dark)
}

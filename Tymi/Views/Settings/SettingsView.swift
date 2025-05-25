import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @AppStorage("themeMode") private var themeMode: ThemeMode = .system

    var body: some View {
        NavigationStack {
            List {
                Section {
                    // Archived habits section
                    NavigationLink {
                        ArchivedHabitsView()
                    } label: {
                        HStack {
                            Label("archived_habits".localized, systemImage: "archivebox")
                            Spacer()
                            ArchivedHabitsCountBadge()
                        }
                    }
                    
                    // Folders management
                    NavigationLink {
                        UnifiedFolderPickerView()
                    } label: {
                        Label("folders".localized, systemImage: "folder")
                    }
                    
                    AppIconSection()
                    AppearanceSection()
                    AppColorSection()
                    WeekStartSection()
                    LanguageSection()
                }
                
                Section {
//                    NavigationLink {
//                        CloudKitSyncView()
//                    } label: {
//                        Label("icloud_sync".localized, systemImage: "icloud")
//                    }
                    
                    NotificationsSection()
                    HapticsSection()
                }
                
                AboutSection()
                
                // Tymi - version ...
                Section {
                    VStack(spacing: 4) {
                        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
                        
                        Image("TymiBlank")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                        
                        Text("Tymi – \("version".localized) \(version)")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 4) {
                            Text("made_with".localized)
                            Image(systemName: "heart.fill")
                            Text("in_kyrgyzstan".localized)
                            Text("🇰🇬")
                        }
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("settings".localized)
        }
        .preferredColorScheme(themeMode.colorScheme)
    }
}

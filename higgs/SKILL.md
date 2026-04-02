---
name: higgs
version: 1.0.0
description: Generates Hollywood-spec image prompts for Higgsfield AI with a safety disclaimer.
---

# Higgsfield Image Prompt Skill (higgs)

This skill guides the user through creating high-quality, cinematic image prompts for `higgsfield.ai`.

## Workflow

> [!TIP]
> **Director's Intervention Protocol**: The user (Director) has full authority to intervene at any stage. If the user requests changes to plot, storyboard, camera angles, or any parameter:
> 1.  **Acknowledge**: Confirm the requested change.
> 2.  **Adapt**: Modify the current draft or prompt immediately to reflect the new direction.
> 3.  **Confirm**: Present the updated version for approval before proceeding.

### Phase 1: Pre-production (Setup)

1.  **Receive Topic (接收主題)**: 
    *   **Dynamic Generation Logic**:
        1.  **Read Database**: Use `view_file` to read `/home/awang/.config/Antigravity/skills/higgs/topics.json`.
        2.  **Mix Topics**:
            *   **From DB (Max 7)**: Randomly select up to 7 topics from the file.
            *   **Fresh (Min 8)**: Generate 8 **BRAND NEW** topics (diverse genres: Fantasy, Sci-Fi, Horror, History, Abstract). **Do NOT** repeat topics from the DB.
        3.  **Present Menu**: Display the numbered list (1-15) in **Traditional Chinese**.
    *   **Example Output**:
        1.  [From DB] **賽博龐克夜市 (Cyberpunk Street Market)**: ...
        2.  [New] **蒸汽龐克飛船 (Steampunk Airship)**: ...
        ...
        15. [New] **深淵巨獸 (Abyssal Kaiju)**: ...
        16. **自行輸入關鍵字 (Custom Input)**
    *   **STOP & WAIT**: **Do NOT** show the Style menu yet. Wait for the user to select a number.

    > [!IMPORTANT]
    > **Database Update Rule**:
    > When the user selects a topic (or inputs a custom one), you **MUST** check if it exists in `topics.json`.
    > If it is **NEW**, append it to `topics.json` during the final "Save to Database" phase. This ensures the topic pool grows over time.

2.  **Select Style (After Topic Selection)**: 
    *   **Action**: Once the topic is confirmed, present the **Style Menu (Traditional Chinese)**:
    *   **Option 1: 真人實拍 (Photorealistic / Live Action)** - 與現實無法區分 (No Prompt Tags)。
    *   **Option 2: Cinematic Hyper-Realism (CGI)** - **Love, Death & Robots / UE5** (The "Masterpiece" Standard).
    *   **CRITICAL NOTE**: This style refers to **Rendering Quality** (Visual Fidelity), **NOT** Subject Matter. 
        *   If Topic is **Fashion**, focus on **Fabric/Texture/Light** (e.g. Alexander McQueen), NOT Robots.
        *   If Topic is **Medieval**, focus on **Armor/Blood/Mud**, NOT Lasers.
    *   **VISION CONCEPT**: **"Hyper-realistic Cinematic Masterpiece"**.
    *   **The Difference**: It must look like a **National Geographic photo** but rendered by **Weta Digital**.
        *   **Skin (The Key)**: **"Dermatological Reality"**. Sebum secretion (T-zone shine), peeling skin, micro-vessels, salt/sweat crystals.
        *   **Lighting**: **"Dramatic Narrative"**. Dual-tone (Warm/Cool), God Rays (Tyndall effect), Volumetric Fog.
        *   **Tech**: **"UE5 MetaHuman Pipeline"**. Nanite Geometry, Lumen Ray-Tracing, Movie Render Queue (Super-sampled).
    *   **AVOID**: "Flat", "Cartoon", "Low Poly", "Basic Lighting", "Unnecessary Sci-Fi Elements".

### Phase 2: Development (Script & Storyboard)

1.  **Generate 15 Variations**: Based on the topic and style, generate **15 distinct scene concepts**.
    *   **Constraint**: Each concept must be visually striking and suitable for a high-budget Hollywood production.
    *   **Genre Integrity (CRITICAL)**: **Stick to the Genre's Reality**.
        *   **If Topic is Natural/Historical (e.g., Zen Bamboo, Medieval)**: The story must be **GROUNDED**. Use CGI power for **Lighting/Texture/Atmosphere**, NOT for magic. No floating rocks, no invisible people, no glowing plants (unless specified).
        *   **If Topic is Sci-Fi/Fantasy**: You may use surreal physics.
        *   **Rule of Thumb**: If it wouldn't happen in a "National Geographic" documentary or a "Historical Drama", **DON'T DO IT** (unless the Topic is Sci-Fi).
    *   **Layout**: Numbered list (1-15) with Title and 1-sentence visual summary.
    *   **Do not** generate the full prompt yet.

### Phase 3: Lock (Selection & Formatting)

1.  **User Selection**: Wait for the user to select a number (1-15) OR multiple numbers OR custom keywords.
2.  **Construct Full Prompt**:
    *   **Single Selection**: Generate the specific concept.
    *   **Multi-Selection / Custom Input (FUSION PROTOCOL)**:
        *   **Action**: You **MUST** combine all selected elements into **ONE cohesive story/scene**.
        *   **Conflict Resolution**: If options conflict (e.g. Day vs Night), choose the most dramatic combination (e.g. Twilight) or blend them (e.g. "Sun shower").
        *   **Example**: User picks "Frog" + "Firefly" + "Wind" -> *A frog jumps through a windy bamboo forest at twilight, surrounded by fireflies.*
    *   **Adapt the 'Fisherman' Logic** to the subject.
    *   **Keep the Tech Stack** specifically: "Arri Alexa 65", "Panavision Anamorphic", "Bleach Bypass", "Nanite", "Lumen".
    *   **Logic Check (Disclaimer)**:
        *   **IF Style == Option 1 (Photorealistic)**: Do NOT add the safety disclaimer.
        *   **IF Style == Option 2 (CGI)**: **MUST** end with `(以下為虛構情節，所有角色皆為虛構或經官方開放創作使用)`.

#### Prompt Structure (High-Density Narrative Block)

```text
Image Prompt:

**VISION CONCEPT**: A hyper-realistic cinematic masterpiece depicting [Subject] at [Location] involving [Action]. The visual style follows the aesthetic of 'Love, Death & Robots' (Jibaro/Aquila Rift), emphasizing micron-level physical details, complex light-material interaction, and a heavy, gritty narrative atmosphere. Rendered using a virtual Unreal Engine 5 MetaHuman pipeline.

**SUBJECT_DATA**:
• **Character**: [Details]
• **MetaHuman Skin**: Micro-pore expansion, T-zone sebum secretion with subtle oily specular highlights. [Specific details like sunburn/freckles/peeling]. High-intensity SSS on earlobes/nostrils (warm reddish translucency). Visible micro-vessels.
• **Grooming**: Strand-based hair system (Groom), [Hair details], fine vellus hairs visible under strong rim lighting.
• **Attire**: [Material Physics], realistic creasing (cloth simulation), [Wear & Tear details], [Texture/Weave details].

**ENVIRONMENTAL_DATA**:
• **Foreground**: [Ultra-close-up textures, microscopic details].
• **Midground**: [Assets with Nanite detail, high-fidelity AO].
• **Atmosphere**: [Volumetric effects, Tyndall effect/God rays, Dust/Salt particles].

**CINEMATOGRAPHY & LIGHT**:
• **Camera**: Virtual Arri Alexa 65, Panavision C Series Anamorphic Lenses, f/2.0.
• **Lighting**: Dual-tone lighting (e.g., Cold ambient vs. Sharp warm rim). Key source [Direction]. High-reflectivity on wet surfaces.
• **Post-Process**: Bleach Bypass process (High contrast, desaturated), Physical 35mm film grain, Chromatic aberration, Halation.

**TECH_STACK**: Unreal Engine 5 (Lumen GI, Nanite Geometry, Ray-Traced Reflections), Movie Render Queue (64 spatial samples).

[IF CGI STYLE]: (以下為虛構情節，所有角色皆為虛構或經官方開放創作使用)
```

### Phase 4: Video Prompt Expansion (Motion & Sound)

#### 1. Camera Movement Library (鏡頭運動資料庫)
**Basic Camera Moves (Dolly, Pan, Tilt, Truck)**
*   **Dolly In**: "The camera slowly dollies forward toward the subject, cinematic lighting, shallow depth of field."
*   **Dolly Out**: "The camera slowly dollies backward away from the subject, revealing more of the environment."
*   **Fast Dolly In (Rush)**: "The camera rushes quickly forward toward the subject, creating urgency and intensity."
*   **Pan Left**: "The camera pans slowly to the left while keeping the subject centered in frame."
*   **Pan Right**: "The camera pans slowly to the right while keeping the subject centered in frame."
*   **Tilt Up**: "The camera tilts upward from the subject’s feet to their face."
*   **Tilt Down**: "The camera tilts downward from above, moving from the subject’s face to their feet."
*   **Truck Left**: "The camera slides laterally to the left with strong parallax between subject and background."
*   **Truck Right**: "The camera slides laterally to the right with strong parallax between subject and background."
*   **Pedestal Up**: "The camera rises vertically from waist level to eye level."

**Orbital & Crane Moves**
*   **Orbit 180**: "The camera orbits 180 degrees around the subject, shifting from a front view to a side profile."
*   **Orbit 360**: "The camera circles a full 360 degrees around the subject."
*   **Slow Cinematic Arc**: "The camera moves in a wide, slow arc around the subject in a smooth curved motion."
*   **Crane Up**: "The camera cranes upward while tilting down to keep the subject framed, revealing the full environment."
*   **Crane Down**: "The camera descends from a high angle down to eye level."
*   **Crane Overhead**: "The camera sweeps upward and over the subject’s head in a continuous arc, ending in a top-down view."

**Zoom & Lens Effects**
*   **Smooth Zoom In**: "The camera remains static while slowly zooming in on the subject, background stays compressed."
*   **Smooth Zoom Out**: "The camera remains static while slowly zooming out to reveal the full environment."
*   **Crash Zoom In**: "A sudden fast zoom into the subject’s face with motion blur."
*   **Crash Zoom Out**: "A rapid zoom out from close-up to wide shot in a fraction of a second."
*   **Rack Focus**: "The shot begins with the subject in focus, then focus shifts to the background."
*   **Reveal From Blur**: "The frame starts heavily out of focus and gradually sharpens until the subject is crystal clear."

**Aerial & Drone Moves**
*   **Drone Flyover**: "A high-altitude aerial shot moving forward over the landscape, cinematic scale."
*   **Epic Drone Reveal**: "The camera rises upward from behind an obstacle while tilting down to reveal the full scene."
*   **Large Aerial Orbit**: "A wide aerial orbit around the environment from high altitude."
*   **Overhead (Top Down)**: "The camera is positioned directly overhead looking straight down, slowly rotating."
*   **FPV Drone**: "Fast first-person drone movement diving forward and weaving through obstacles at high speed."
*   **Aerial Pullback**: "The camera pulls backward and upward, making the subject shrink within the expanding landscape."

**Subject Tracking**
*   **Leading Shot**: "The subject walks toward the camera while the camera moves backward at the same pace, maintaining distance."
*   **Following Shot**: "The subject walks away from the camera while the camera follows behind at the same speed."
*   **Side Tracking**: "The subject moves forward while the camera tracks alongside from the side with background motion blur."
*   **POV Walk**: "First-person walking motion with natural handheld bobbing, moving forward toward the subject."

**Creative & Advanced**
*   **Vertigo Effect (Dolly Zoom)**: "The camera moves backward while simultaneously zooming in, keeping the subject the same size while the background stretches."
*   **Through Shot**: "The camera moves forward through a foreground object to reveal the scene behind it."
*   **Reveal From Behind**: "The camera slides sideways from behind an obstacle, gradually revealing the subject."
*   **Dutch Angle**: "The camera is tilted diagonally on its axis, creating a tense, off-balance composition."
*   **Whip Pan**: "The camera whips rapidly to the side with heavy motion blur, transitioning to a new subject."
*   **Handheld Documentary**: "Natural handheld camera shake and subtle human movement while following the subject."
*   **MO-CAP / ROBOTIC ARM**: "Fast lateral passes, snappy accelerations, no shake. (Character face/outfit stable)."

#### 2. Generate Video Prompt
    *   **Goal**: Transform the static image into a "Hollywood Trailer Shot".
    *   **Logic Check (Tags)**:
        *   **IF Style == Option 1 (Photorealistic)**: Start directly with the action. **NO** `[UE5]` tag.
        *   **IF Style == Option 2 (CGI)**: **MUST** start with `[UE5 / CGI Render]`.
    *   **Logic Check (Duration)**:
        *   **Default**: 5 Seconds (`[Duration: 5s]`).
        *   **User Specified**: If user asks for specific time (e.g., 10s), use that.
        *   **Long Shot Rule (>5s)**: If duration > 5s, you **MUST** design a **Multi-Stage Camera Move** or **Cuts** (Split into Shot A / Shot B) to maintain visual interest.
    *   **Camera Movement**: **MUST** use a specific term from the **Camera Movement Library** (e.g., "MO-CAP / ROBOTIC ARM", "ORBIT"). Match the movement to the scene's tension.
    *   **Physics & Action**: Describe *what moves* (Hair in wind, Cloth simulation, debris, sweat dripping).
    *   **Sound Design**: Add a specific soundscape description (SFX / Dialogue).

#### Video Prompt Structure

```text
Video Prompt:

[IF CGI]: [UE5 / CGI Render] 
[Duration: 5s (or User Defined)]
[Camera Movement: e.g., Slow Dolly In + Dutch Angle]. A cinematic sequence showing [Subject Action].

**VISUALS**:
• **Camera**: [Dynamic Move]. Focus pulls from [A] to [B]. [IF >5s]: Then cuts to / Transitions to [Second Move].
• **Physics**: [Detailed motion: Cloth fluttering, Rain splashing, Muscle tension, Hair physics].
• **Atmosphere**: [Fog swirling, Light flickering, Dust motes dancing].

**AUDIO (SFX/Dialogue)**:
• **SFX**: [Detailed Sound Design: e.g., "Heavy breathing, rhythmic roller skate wheels on wood, distant seagulls, swelling synthwave bassline"].
• **Dialogue**: [Optional: specific line or "No Dialogue"].
```

### Phase 5: Distribution (Output & Archival)

1.  **Display Prompts**: Output **BOTH** the Image Prompt and Video Prompt in separate code blocks.
3.  **Save to Database**: 
    *   **Prompt**: Append the generated prompt to `/home/awang/.config/Antigravity/skills/higgs/prompts.json`.
    *   **Topic**: **CRITICAL**: Check if the **Selected Topic Name** exists in `/home/awang/.config/Antigravity/skills/higgs/topics.json`. If not, **APPEND** it to the list and save the file. This fulfills the "Growing Database" requirement.
4.  **Launch**: Provide the link: `https://higgsfield.ai/`.

## Safety Protocol

> [!WARNING]
> You **MUST** include the following text at the very end of every generated prompt:
> `(以下為虛構情節，所有角色皆為虛構或經官方開放創作使用)`
> This is required to prevent AI moderation rejection.

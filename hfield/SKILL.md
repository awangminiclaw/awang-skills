---
name: hfield
description: Generates prompts and parameters for Higgsfield AI Cinema Studio (Real & Unreal Modes)
---

# Higgsfield Cinema Studio Skill (hfield)

This skill guides the user through the Higgsfield AI Cinema Studio workflow, offering specialized modes for Photorealistic and Unreal Engine 5 visualizations.

## Workflow

### Phase 0: Image Context (圖片上下文設定)

**Step 1: Application Mode (應用模式)**
Present the following choices to the user:
1.  **上傳圖片 (Upload Images)**: Upload up to 4 images. The last image can be a pure background. These images will be used to design the story and characters.
2.  **無圖片 (No Images)**: Skip to **Phase 1**.

**Step 2: Reference Mode (參考模式 - Only if Step 1 = Option 1)**
If user selected "Upload Images", ask for the reference mode *after* they upload the images:
1.  **完全參考 (Full Reference)**: Keep ALL visual traits of the character, including facial features, body type, AND **Clothing/Outfit**.
2.  **保留特徵，排除服裝 (Body Features Only)**: Keep facial features and body type, but **Exclude/Change** the clothing based on the generated story context.

> [!NOTE]
> **Image Slot Logic**:
> Whether the user uploads images or not, the generated prompts MUST refer to characters as `[Image 1]`, `[Image 2]`, etc.
> *   **If Images Uploaded**: `[Image 1]` = 1st uploaded image.
> *   **If NO Images**: User will assign a character image to the `[Image 1]` slot in the software later. You are designing who that character *should* be.

### Phase 1: Style Selection (風格選擇)

Present the following menu to the user:

1.  **真人實拍 (Photorealistic / Live Action)**
    *   **Focus**: Hyper-realistic cinematography, 35mm film grain, natural lighting.
    *   **Keywords**: Arri Alexa, Kodak Vision3, Anamorphic Lens.

2.  **超擬真 (Unreal Engine 5 / CGI Masterpiece)**
    *   **Focus**: "Love, Death & Robots" aesthetic, MetaHuman quality, stylized realism.
    *   **MANDATORY PROMPT INJECTION**: You **MUST** start the prompt with:
        > `Unreal Engine 5 render, Love Death & Robots animation style：1.2, MetaHuman quality, Subsurface Scattering (SSS) skin texture, ACES color system, Hollywood blockbuster composition, Cinemascope 2.35:1, volumetric lighting, anamorphic lens flares, depth of field, stylized realism, ultra-detailed organic textures, 8k resolution, 3D CGI masterpiece.`
    *   **NEGATIVE PROMPT**:
        > `--no sci-fi, technology, cyborg, robot, mechanical parts, wires, metal skin, glitch, cyberpunk, photograph, camera noise.` (Unless user topic specifically requires sci-fi elements, then adjust accordingly but keep the clean render look).

### Phase 2: Topic Selection (主題選擇)

Generates a list of 16 options.

**CRITICAL LOGIC (Image Context Influence)**:
*   **IF Phase 0 = Upload Images**:
    *   You **MUST** generate **at least 10 topics** that directly fit the character/vibe of the uploaded images.
    *   *Example*: If user uploaded a Cowboy (`[Image 1]`), generate Western, Frontier, Heist topics.
*   **IF Phase 0 = No Images**:
    *   Follow the standard random logic (mix of genres).

1.  **Read Database**: Read `/home/awang/.config/Antigravity/skills/hfield/data/topics.json`.
2.  **Generate List**:
    *   **From Database**: Randomly select **5 topics** (ensure they loosely fit the image vibe if applicable).
    *   **Brand New**: Generate **10 BRAND NEW** high-concept movie ideas based on the **Image Context** (if available) or Randomly (if not).
3.  **Format**:
    *   1. [Title in Chinese] (English Title) - Brief 1-sentence premise.
    *   ...
    *   15. [Title in Chinese] (English Title) - Brief 1-sentence premise.
    *   16. **自訂輸入 (Custom Input)**

> [!IMPORTANT]
> **Custom Input Logic**:
> If the user selects **16**, ask for their keywords.
> Then, use your AI capabilities to expand those keywords into a **Hollywood Blockbuster-level story**, complete with:
> *   **Visual Direction**: Lighting, Color Palette, Camera Angles.
> *   **Narrative**: High stakes, emotional depth.
> *   **Composition**: CinemaScope, Rule of Thirds, Leading Lines.

### Phase 3: Production (30s High-Tempo Trailer)

Once Style and Topic are set, generate a **High-Octane 30-Second Trailer Storyboard** (10-12 Shots). 
*   **Tool Limitation**: Duration **Min 3s, Max 12s**.
*   **Pacing Strategy**: Use "Internal Motion" (Action speed) for intensity.

**1. Cast & Continuity (角色與連貫性 - MASTER PROMPT)**
*   **Consistency Strategy**: You MUST generate a **"Master Prompt Block"** for the main character/object. This block **MUST** be pasted *verbatim* at the start of every single shot prompt.
*   **Source Logic**:
    *   **IF Phase 0 = No Images**: Create a new character description. This defines who the user should put in the `[Image 1]` slot.
    *   **IF Phase 0 = Upload Images + Mode 1 (Full)**: Describe the **exact** character in `[Image 1]`, **including** specific clothing.
    *   **IF Phase 0 = Upload Images + Mode 2 (Body Only)**: Describe `[Image 1]`'s **physical traits** (Face, Hair, Body), but **DESIGN NEW CLOTHING** that perfectly fits the chosen **Phase 2 Topic**.
*   *Master Block Example*: `(Unreal Engine 5 render, Masterpiece), [Character Name], [Age/Gender], [Hairstyle/Color], [Key Face Feature], [Signature Outfit (Based on Mode)], [Visual Anchor Item]`
*   **Physical Evolution**: Add status *after* the Master Block (e.g., "Master Block + *covered in mud, bleeding lip*").

**2. Visual Rules (MANDATORY)**
*   **NO CENTER FRAMING**: Use **Rule of Thirds**, **Off-Center**.
*   **MANDATORY FX**: Wind, Rain, Ember, Dust, Debris in *every* shot.
*   **INTERACTION**: Pushing, Hitting, Running, Reacting.

**3. Prompt Writing Rules (CRITICAL)**
*   **STRICT ROLE NAMES**: You **MUST** refer to characters ONLY as `[Image 1]`, `[Image 2]`, or `[Image 3]`.
    *   **REASON**: The user will assign specific images to these slots in the software.
    *   **[Image 1]** = Main Character / Protagonist.
    *   **[Image 2]** = Antagonist / Sidekick / Secondary Character.
*   **NO GENDER/TYPE TERMS**: Do NOT use "The man", "The woman", "Jack".
*   **LIMIT**: Supports maximum **3 Roles**.
*   **BAD**: `Jack runs.` / `The man runs.` / `[Role 1] runs.`
*   **GOOD**: `[Image 1] runs.` / `[Image 1] talking to [Image 2].`

**4. Camera Movement Library (鏡頭運動資料庫)**
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

**5. Detail & Length Strategy (CRITICAL)**
*   **Target Length**: You **MUST** aim for **~800 characters** per shot prompt.
*   **How to Expand**: Do NOT just add fluff. Add **dense visual information**:
    *   **Textures**: Rust on metal, weave of fabric, pores on skin, water droplets on glass.
    *   **Lighting**: Subsurface scattering, rim lighting, volumetric fog density, light color temperature, shadow softness.
    *   **Atmosphere**: Dust motes, humidity, heat haze, static electricity, floating debris.
    *   **Micro-Acting**: Twitching muscle, dilated pupils, heavy breathing, specific finger movements.
    *   **Environment**: Background storytelling elements, wear and tear, history of the location.
*   **Rule**: If the prompt is too short, **refine and expand** the `[Action]`, `[Lighting]`, and `[Composition]` descriptions until it is rich and immersive.

**6. Pacing & Tension (起伏控制)**
*   Assign a **TENSION LEVEL (1-10)** to each shot to guarantee the "Highs and Lows" (Contrast):
    *   **Level 1-3 (Low)**: Atmosphere, establishing, slow movement. (The Calm)
    *   **Level 4-7 (Mid)**: Conflict, tension, rapid movement. (The Build-up)
    *   **Level 8-10 (High)**: Explosion, scream, impact, fast cuts. (The Climax)

**7. Output Format & file Generation**
*   **STEP 1**: Generate the content below.
*   **STEP 2**: **CRITICAL**: In every `[SHOT X]` code block, you **MUST** replace the text `[Insert Master Prompt string here]` with the **ACTUAL** Master Prompt text you defined at the top. Do NOT use a placeholder like "[MASTER PROMPT BLOCK]". The user needs the full text in every shot.
*   **STEP 3**: Use `write_to_file` to save this content to: `/home/awang/Storyboards/[Movie_Title_Snake_Case].md`.
*   **STEP 4**: Present the content in the chat.

Present in this exact format:

---
**[MOVIE TITLE]**
`[Insert Cinematic Title Here]` (e.g., *The Tears of Kyoto*)

**MASTER PROMPT BLOCK (Copy consistency)**
`[Insert the Master Prompt string here for reference]`
---

## ACT 1: THE HOOK (Low Tension)
- [ ] **[SHOT 1]**
```text
[Insert Master Prompt string here]
[Composition: OFF-CENTER/RULE OF THIRDS/WIDE]
[Action: Establishing Action + FX (e.g. Fog/Dust)]
[Lighting: Cinematic Atmosphere]
```
*   **Tension**: `[1-3]` | **Duration**: `[4s-6s]` | **Speed Ramp**: `[Auto/Slow mo]`
*   **Camera**: `[Movement from Library]` | **Lens**: `[mm]` | **Aperture**: `[f-stop]`
*   **Dialogue**: `"Image 1: [Line]"`

- [ ] **[SHOT 2]** ... (Continue using full Master Prompt string)

## ACT 2: THE TURN (Rising Tension)
- [ ] **[SHOT 4]**
```text
[Insert Master Prompt string here]
[Composition: LOW ANGLE/DUTCH]
[Action: Conflict/Reaction + FX (e.g. Rain/Sparks)]
[Status: Clothes tearing/Dirty]
```
*   **Tension**: `[4-7]` | **Duration**: `[3s-5s]` | **Speed Ramp**: `[Linear]`
*   **Camera**: `[Movement from Library]` | **Lens**: `[mm]` | **Aperture**: `[f-stop]`
*   **Dialogue**: `"Image 1: [Line]"`

- [ ] **[SHOT 5]** ... (Continue using full Master Prompt string)

## ACT 3: THE CLIMAX (Peak Tension)
- [ ] **[SHOT 8]**
```text
[Insert Master Prompt string here]
[Composition: DYNAMIC ACTION]
[Action: HIGH IMPACT + FX (e.g. EXPLOSION/DEBRIS)]
[Status: Battle Damaged/Wet/Bloody]
```
*   **Tension**: `[8-10]` | **Duration**: `[3s]` | **Speed Ramp**: `[Linear/Fast]`
*   **Camera**: `[Fast Movement]` | **Lens**: `[mm]` | **Aperture**: `[f-stop]`
*   **Dialogue**: `No Dialogue`

- [ ] **[SHOT 9]** ... (Continue using full Master Prompt string)

## ACT 4: RESOLVE (Release)
- [ ] **[SHOT 12]**
```text
[Insert Master Prompt string here]
[Composition: SILHOUETTE/WIDE]
[Action: Aftermath + FX (e.g. Smoke/Ash)]
```
*   **Tension**: `[1-3]` | **Duration**: `[4s-6s]` | **Speed Ramp**: `[Slow mo]`
*   **Camera**: `[Slow Orbit/Dolly]`
*   **Dialogue**: `"Image 1: [Line]"`

---

**Global Negative Prompt:**
```text
[Insert Style-Specific Negative Prompt Here]
```

**Aspect Ratio**: `2.35:1`

### Phase 4: Final Check
Remind the user to configure the "Director Panel" for each shot individually using the "Multi-shot Manual" mode.

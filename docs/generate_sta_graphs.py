import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from pathlib import Path

out = Path("docs/images")
out.mkdir(parents=True, exist_ok=True)
corners = ["TT", "SS", "FF"]

# Values taken from the existing STA summaries.
route_setup = [7.23, 1.24, 7.82]
route_hold  = [0.35, 0.76, 0.14]
spef_setup  = [7.30, 1.52, 7.86]
spef_hold   = [0.31, 0.72, 0.11]

def grouped_graph(filename, title, ylabel, series, labels, zero_line=False):
    x = list(range(len(corners)))
    width = 0.34
    fig, ax = plt.subplots(figsize=(8, 5))
    for i, (values, label) in enumerate(zip(series, labels)):
        offset = (i - (len(series) - 1) / 2) * width
        bars = ax.bar([v + offset for v in x], values, width, label=label)
        ax.bar_label(bars, fmt="%.2f", padding=3, fontsize=9)
    ax.set_xticks(x, corners)
    ax.set_xlabel("Timing-library corner")
    ax.set_ylabel(ylabel)
    ax.set_title(title)
    ax.grid(axis="y", alpha=0.25)
    if zero_line:
        ax.axhline(0, linewidth=1)
    ax.legend()
    fig.tight_layout()
    fig.savefig(out / filename, dpi=180)
    plt.close(fig)

grouped_graph("sta_setup_slack.png", "Setup Slack by Corner",
              "Worst setup slack (ns)",
              [route_setup, spef_setup],
              ["Global-route RC estimate", "Experimental extracted SPEF"])

grouped_graph("sta_hold_slack.png", "Hold Slack by Corner",
              "Worst hold slack (ns)",
              [route_hold, spef_hold],
              ["Global-route RC estimate", "Experimental extracted SPEF"])

grouped_graph("sta_worst_slack.png", "Worst Setup and Hold Slack",
              "Worst slack (ns)",
              [[7.23, 1.24, 7.82], [0.35, 0.76, 0.14],
               [7.30, 1.52, 7.86], [0.31, 0.72, 0.11]],
              ["Route setup", "Route hold", "Extracted setup", "Extracted hold"])

# Explicit WNS/TNS reported by OpenSTA for these runs.
zeros = [0.0, 0.0, 0.0]
grouped_graph("sta_wns.png", "WNS by Corner (Reported)",
              "WNS (ns)", [zeros, zeros],
              ["Setup WNS", "Hold WNS"], zero_line=True)

grouped_graph("sta_tns.png", "TNS by Corner (Reported)",
              "TNS (ns)", [zeros, zeros],
              ["Setup TNS", "Hold TNS"], zero_line=True)

print("Created STA graphs:")
for name in ["sta_setup_slack.png", "sta_hold_slack.png",
             "sta_worst_slack.png", "sta_wns.png", "sta_tns.png"]:
    print(f"{out / name} ({(out / name).stat().st_size} bytes)")
